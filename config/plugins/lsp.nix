{ lib, pkgs, ... }:

{
  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;

      servers = {
        nixd = {
          filetypes = [ "nix" ];
          cmd = [ "${pkgs.nixd}/bin/nixd" ];
        };

        clangd = {
          filetypes = [
            "c"
            "cpp"
          ];
          cmd = [ "${pkgs.clang-tools}/bin/clangd" ];
        };
      };
    };

    languages = {
      bash.lsp.enable = true;
      clang.lsp.enable = true;
      python.lsp.enable = false;
      nix.lsp.enable = true;
    };
  };
}
