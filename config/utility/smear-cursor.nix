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

          -- Enable particle effects for extra flair
          particles_enabled = true,

          -- Smooth trail settings
          stiffness = 0.8,              -- Cursor movement responsiveness
          trailing_stiffness = 0.4,      -- Trail follows slower for longer effect
          trailing_exponent = 0.15,      -- More gradual fade at the end

          -- Distance threshold for smear effect
          distance_stop_animating = 0.5,
          hide_target_hack = false,
        })
      '';
    };
  };
}
