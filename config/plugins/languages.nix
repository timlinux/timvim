{ pkgs, ... }:
{
  vim = {
    languages = {
      enableFormat = true;
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableTreesitter = true;

      bash = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
      };

      clang = {
        enable = true;
        cHeader = true;
        dap.enable = true;
        lsp.enable = true;
      };

      java = {
        enable = true;
        lsp.enable = true;
      };

      nix = {
        enable = true;
        format.enable = true;
        format.type = "nixfmt";
        #format.package = pkgs.nixfmt-rfc-style;
        lsp = {
          enable = true;
          server = "nixd";
          options = {
            nixpkgs = {
              expr = "import <nixpkgs> { }";
            };
          };
        };
      };

      python = {
        enable = true;
        format.type = "black";

      };

    };
  };
}
