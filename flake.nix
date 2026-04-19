{
  description = "timvim: An NVF-based Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:notashelf/nvf";
    plugin-claude-code = {
      url = "github:coder/claudecode.nvim";
      flake = false;
    };
    plugin-octo = {
      url = "github:pwntester/octo.nvim";
      flake = false;
    };
    term2alpha.url = "git+https://git.sr.ht/~zethra/term2alpha";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      flake-parts,
      nvf,
      plugin-claude-code,
      plugin-octo,
      term2alpha,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              (_final: _prev: {
                stable = import nixpkgs-stable {
                  inherit system;
                  config.allowUnfree = true;
                  config.nvidia.acceptLicense = true;
                };
              })
            ];
            config.allowUnfree = true;
          };

          claude-code-plugin = pkgs.vimUtils.buildVimPlugin {
            name = "claudecode.nvim";
            src = inputs.plugin-claude-code;
          };

          octo-plugin = pkgs.vimUtils.buildVimPlugin {
            name = "octo.nvim";
            src = inputs.plugin-octo;
            doCheck = false; # Disable require check - plugin has runtime dependencies
          };

          nvimConfig = nvf.lib.neovimConfiguration {
            inherit pkgs;
            extraSpecialArgs = {
              claude-code-plugin = claude-code-plugin;
              octo-plugin = octo-plugin;
            };
            modules = [ ./config ];
          };

          # Runtime dependencies that must be in PATH for Neovim plugins
          runtimeDeps = [
            pkgs.ripgrep
            pkgs.fd
            pkgs.fzf
            pkgs.chafa
            pkgs.git
            pkgs.go
            pkgs.gopls
            pkgs.gotools # Contains goimports for Go formatting
            pkgs.delve
            pkgs.harper
            # RST/Sphinx tools
            pkgs.python3Packages.rstcheck
            pkgs.python3Packages.doc8
            # pkgs.esbonio # Not available in nixpkgs
            # pkgs.rstfmt # Not available in nixpkgs
            # Node.js 22+ required by Copilot.lua
            pkgs.nodejs_22
          ];

          # Wrap the Neovim package to include runtime dependencies
          # Adding runtimeDeps to paths ensures they're part of the closure
          wrappedNeovim = pkgs.symlinkJoin {
            name = "timvim-wrapped";
            paths = [ nvimConfig.neovim ] ++ runtimeDeps;
            buildInputs = [ pkgs.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/nvim \
                --prefix PATH : ${pkgs.lib.makeBinPath runtimeDeps}
            '';
          };
        in
        {
          _module.args.pkgs = pkgs;

          packages.default = wrappedNeovim;

          apps.default = {
            type = "app";
            program = "${wrappedNeovim}/bin/nvim";
            meta = {
              description = "Launch timvim NVF config";
            };
          };

          checks = {
            ## ✅ 1) Format check
            format-check =
              pkgs.runCommand "format-check"
                {
                  nativeBuildInputs = [
                    pkgs.nixfmt-rfc-style
                    pkgs.diffutils
                    pkgs.rsync
                  ];
                }
                ''
                  echo "📏 Running nixfmt-rfc-style check..."

                  mkdir $TMPDIR/orig
                  mkdir $TMPDIR/formatted

                  rsync -a --exclude orig --exclude formatted --exclude .git --exclude result ./ $TMPDIR/orig/
                  rsync -a $TMPDIR/orig/ $TMPDIR/formatted/

                  find $TMPDIR/formatted -name '*.nix' -exec nixfmt {} +

                  diff -ru $TMPDIR/orig $TMPDIR/formatted || (echo '❌ Formatting issues found'; exit 1)

                  touch $out
                '';

            ## ✅ 2) Deadnix check
            deadnix =
              pkgs.runCommand "deadnix-check"
                {
                  nativeBuildInputs = [ pkgs.deadnix ];
                }
                ''
                  echo "🧹 Running deadnix..."
                  deadnix check . || (echo "❌ Dead code found"; exit 1)
                  touch $out
                '';

            ## ✅ 3) Statix check
            statix =
              pkgs.runCommand "statix-check"
                {
                  nativeBuildInputs = [ pkgs.statix ];
                }
                ''
                  echo "🕵️ Running statix..."
                  statix check . || (echo "❌ Style issues found"; exit 1)
                  touch $out
                '';
          };

          formatter = pkgs.nixfmt-rfc-style;

          devShells.default = pkgs.mkShell {
            packages =
              with pkgs;
              [
                catimg # Terminal image viewer for alpha header generation
                chafa
                epub-thumbnailer
                fd
                ffmpegthumbnailer
                git
                imagemagick
                pre-commit
                poppler-utils
                nixfmt-rfc-style
                nixd
                nerd-fonts.jetbrains-mono
                ripgrep
                deadnix
                statix
                nodejs_22 # Node.js for GitHub Copilot inline completion
                # Python development essentials
                python3
                pyright
                python3Packages.debugpy
                python3Packages.black
                # Go development essentials
                go
                gopls
                delve
                gotools
                go-tools
                # Additional formatters
                stylua # Lua formatter
                shfmt # Shell formatter
                nodePackages.prettier # Markdown, JS, HTML formatter
                google-java-format # Java formatter
                harper # Grammar checker LSP
                # RST/Sphinx development tools
                python3Packages.rstcheck
                python3Packages.doc8
                python3Packages.sphinx
                python3Packages.sphinx-autobuild
                python3Packages.rst2pdf
                # python3Packages.esbonio # Not available in nixpkgs
                # rstfmt # Not available in nixpkgs
              ]
              ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.fontpreview ]
              ++ [ inputs.term2alpha.packages.${system}.default ];
          };
        };

      flake = {
        homeModules.default =
          { pkgs, system, ... }:
          {
            home.packages = [
              # Core tools bundled with timvim: ripgrep, fd, fzf, chafa, git
              pkgs.epub-thumbnailer
              pkgs.fontpreview
              pkgs.ffmpegthumbnailer
              pkgs.imagemagick
              pkgs.pre-commit
              pkgs.poppler-utils
              pkgs.nixfmt-rfc-style
              pkgs.nixd
              pkgs.nerd-fonts.jetbrains-mono
              pkgs.nodejs_22 # Node.js for GitHub Copilot inline completion
              # Python development essentials
              pkgs.python3
              pkgs.pyright
              pkgs.python3Packages.debugpy
              pkgs.python3Packages.black
              # Go development essentials
              pkgs.go
              pkgs.gopls
              pkgs.delve
              pkgs.gotools
              pkgs.go-tools
              # Additional formatters
              pkgs.stylua # Lua formatter
              pkgs.shfmt # Shell formatter
              pkgs.nodePackages.prettier # Markdown, JS, HTML formatter
              pkgs.google-java-format # Java formatter
              pkgs.harper # Grammar checker LSP

              # Use the wrapped timvim package that includes runtime dependencies
              inputs.self.packages.${system}.default
            ];
          };
      };
    };
}
