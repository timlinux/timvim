{ pkgs, ... }:
{
  vim.extraPlugins = {
    smear-cursor = {
      package = pkgs.vimPlugins.smear-cursor-nvim;
      setup = ''
        require('smear_cursor').setup({
          -- Smear cursor when switching buffers or windows
          smear_between_buffers = true,

          -- Smear cursor when moving in insert or normal mode
          smear_between_neighbor_lines = true,

          -- Use floating windows for the smear effect
          use_floating_windows = true,

          -- Set to true if your font supports legacy computing symbols
          legacy_computing_symbols_support = false,
        })
      '';
    };
  };
}
