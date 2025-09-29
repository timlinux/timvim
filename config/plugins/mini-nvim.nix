{ pkgs, ... }:
{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.mini-nvim
    ];
    pluginRC.mini-pairs = ''
      require('mini.pairs').setup()
    '';
    pluginRC.mini-colors = ''
      require('mini.colors').setup()
      -- You can use :lua MiniColors.pick() to pick a color
      vim.keymap.set("n", "<leader>cp", function() require('mini.colors').pick() end, { desc = "Pick Color (MiniColors)" })
    '';
  };
}
