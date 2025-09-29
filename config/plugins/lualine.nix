{ pkgs, ... }:
{
  vim = {

    statusline = {
      lualine = {
        enable = true;
        theme = "horizon";
        icons.enable = true;
        disabledFiletypes = [
          "alpha"
        ];
      };
    };
  };
}
