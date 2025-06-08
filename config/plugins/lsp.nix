{ lib, pkgs, ... }:

{
  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
    };
  };

}
