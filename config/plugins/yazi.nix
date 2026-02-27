{ pkgs, ... }:
{
  vim.extraPlugins.yazi = {
    package = pkgs.vimPlugins.yazi-nvim;
    setup = ''
      require("yazi").setup({
        -- Enable yazi to take over directory buffers
        open_for_directories = true,

        -- Keymaps inside yazi window
        keymaps = {
          show_help = '<f1>',
          open_file_in_vertical_split = '<c-v>',
          open_file_in_horizontal_split = '<c-x>',
          open_file_in_tab = '<c-t>',
          grep_in_directory = '<c-s>',
          replace_in_directory = '<c-g>',
          cycle_open_buffers = '<tab>',
          copy_relative_path_to_selected_files = '<c-y>',
        },

        -- Floating window options
        floating_window_scaling_factor = 0.9,
        yazi_floating_window_winblend = 0,
        yazi_floating_window_border = 'rounded',

        -- Log level (optional)
        log_level = vim.log.levels.INFO,
      })
    '';
  };

  # Disable netrw since yazi will handle directory buffers
  vim.luaConfigRC.disable-netrw = ''
    -- Disable netrw (yazi will handle directories)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  '';

  # Keybindings for yazi
  vim.keymaps = [
    {
      key = "-";
      mode = "n";
      silent = true;
      action = "<cmd>Yazi<CR>";
      desc = "Open Yazi File Manager";
    }
    {
      key = "<leader>fo";
      mode = "n";
      silent = true;
      action = "<cmd>Yazi<CR>";
      desc = "Open Yazi at Current File";
    }
    {
      key = "<leader>fO";
      mode = "n";
      silent = true;
      action = "<cmd>Yazi cwd<CR>";
      desc = "Open Yazi in Working Directory";
    }
    {
      key = "<leader>fy";
      mode = "n";
      silent = true;
      action = "<cmd>Yazi toggle<CR>";
      desc = "Toggle/Resume Last Yazi Session";
    }
  ];
}
