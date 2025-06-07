{ lib, pkgs, ... }:

{
  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;
      formatOnSave = true;

      servers = {
        nixd = {
          filetypes = [ "nix" ];
          cmd = [ "${pkgs.nixd}/bin/nixd" ];
          settings = {
            nixd = {
              formatting = {
                command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
              };
            };
          };
        };

        clangd = {
          filetypes = [
            "c"
            "cpp"
          ];
          cmd = [ "${pkgs.clang-tools}/bin/clangd" ];
        };

        pylsp = {
          filetypes = [ "python" ];
          cmd = [
            "${pkgs.python311Packages.python-lsp-server}/bin/pylsp"
          ];
          settings = {
            pylsp.plugins = {
              mypy = {
                enabled = true;
                live_mode = false;
              };
              #Linting
              flake8.enable = true;

              # Formatter
              black.enable = true;

              # Refractor
              rope.enable = true;
            };
          };
        };
      };
    };

    languages = {
      bash.lsp.enable = true;
      clang.lsp.enable = false;
      python.lsp.enable = false;
      nix.lsp.enable = false;
    };
  };
}
