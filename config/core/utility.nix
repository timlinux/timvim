{ pkgs, ... }:
{
  vim.utility = {
    preview = {
      glow.enable = true;
      glow.mappings.openPreview = "<leader>mg";
      markdownPreview = {
        enable = true;
        alwaysAllowPreview = true;
        autoClose = true;
        autoStart = true;
      };
    };
  };
}
