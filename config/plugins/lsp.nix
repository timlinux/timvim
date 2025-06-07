{ lib, pkgs, ... }:

{
  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;

      servers = {
        clangd = { };
        pyright = { };
        tsserver = { };
      };
    };

    languages = {
      bash.lsp.enable = true;
      clang.lsp.enable = true;
      python.lsp.enable = true;

      nix.lsp = {
        enable = true;

      };
      #typescript.lsp.enable = true;
    };
  };
}
