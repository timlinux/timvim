{ lib, pkgs, ... }:

{
  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;
      formatOnSave = true;
      lspSignature.enable = true;
      lspkind.enable = true;
      lspsaga.enable = true;
      inlayHints.enable = true;

      null-ls.enable = true;
    };
  };

}
