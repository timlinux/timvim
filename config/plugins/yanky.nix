{ pkgs, ... }:
{
  vim.utility.yanky-nvim = {
    enable = true;

    setupOpts = {
      highlight = {
        on_yank = {
          enable = true;
          higroup = "IncSearch";
          timeout = 200;
        };
        on_put = {
          enable = true;
          higroup = "Visual";
          timeout = 200;
        };
      };
    };
  };
}
