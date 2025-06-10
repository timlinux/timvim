{ pkgs, ... }:
{
  vim.terminal = {
    toggleterm = {
      enable = true;
      lazygit.enable = true;
      setupOpts = {
        direction = "float";
      };
    };
  };
}
