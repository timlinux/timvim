{
  description = "timvim: An NVF-based Neovim configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      flake-parts,
      nvf,
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

          nvimConfig = nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [ ./config ];
          };
        in
        {
          _module.args.pkgs = pkgs;

          packages.default = nvimConfig.neovim;

          apps.default = {
            type = "app";
            program = "${nvimConfig.neovim}/bin/nvim";
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
                nodejs_20 # Node.js for GitHub Copilot
                # Python development essentials
                python3
                pyright
                python3Packages.debugpy
                python3Packages.black
                # Additional formatters
                stylua # Lua formatter
                shfmt # Shell formatter
                nodePackages.prettier # Markdown, JS, HTML formatter
                google-java-format # Java formatter
              ]
              ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.fontpreview ];
          };
        };

      flake = {
        homeModules.default =
          { pkgs, ... }:
          {
            home.packages = [
              pkgs.chafa
              pkgs.epub-thumbnailer
              pkgs.fd
              pkgs.fzf
              pkgs.fontpreview
              pkgs.ffmpegthumbnailer
              pkgs.git
              pkgs.imagemagick
              pkgs.pre-commit
              pkgs.poppler-utils
              pkgs.nixfmt-rfc-style
              pkgs.nixd
              pkgs.nerd-fonts.jetbrains-mono
              pkgs.ripgrep
              # Node.js for GitHub Copilot
              pkgs.nodejs_20
              # Python development essentials
              pkgs.python3
              pkgs.pyright
              pkgs.python3Packages.debugpy
              pkgs.python3Packages.black
              # Additional formatters
              pkgs.stylua # Lua formatter
              pkgs.shfmt # Shell formatter
              pkgs.nodePackages.prettier # Markdown, JS, HTML formatter
              pkgs.google-java-format # Java formatter

              (nvf.lib.neovimConfiguration {
                inherit pkgs;
                modules = [ ./config ];
              }).neovim
            ];
          };
      };
    };
}
