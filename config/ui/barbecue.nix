{ pkgs, ... }:
{
  vim = {
    startPlugins = with pkgs.vimPlugins; [
      barbecue-nvim
      nvim-navic
      # nvim-web-devicons provided by NVF's visuals module - don't duplicate
    ];

    pluginRC.barbecue-nvim = ''
      require("barbecue").setup({
        attach_navic = true,
        theme = "auto",
        show_modified = true,
      })
    '';
  };
}
