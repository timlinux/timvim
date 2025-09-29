{ pkgs, ... }:
{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.nvim-colorizer-lua
    ];
    pluginRC.colorizer = ''
      require('colorizer').setup()
    '';
  };
}
