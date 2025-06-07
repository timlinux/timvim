{ pkgs, ... }:
{
  vim.keymaps = [
    # Find Files witih File Names
    {
      key = "<leader>ff";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope find_files<CR>";
    }
    # Find Files with File Contents
    {
      key = "<leader>fg";
      mode = "n";
      silent = true;
      action = "<cmd>Telescope live_grep<CR>";
    }
    # Open File Explorer
    {
      key = "<leader>n";
      mode = "n";
      silent = true;
      action = "<cmd>Neotree filesystem reveal left<CR>";
    }
  ];
}
