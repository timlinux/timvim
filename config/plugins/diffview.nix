{ pkgs, ... }:
{
  vim = {
    startPlugins = with pkgs.vimPlugins; [
      diffview-nvim
    ];

    pluginRC.diffview = ''
      require("diffview").setup({
        use_icons = true,
      })

      vim.keymap.set("n", "<leader>gv", "<cmd>DiffviewOpen<CR>", { desc = "Open Diff View" })
      vim.keymap.set("n", "<leader>gV", "<cmd>DiffviewClose<CR>", { desc = "Close Diff View" })
      vim.keymap.set("n", "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", { desc = "File Git History" })
      vim.keymap.set("n", "<leader>gF", "<cmd>DiffviewFileHistory<CR>", { desc = "Project Git History" })
    '';
  };
}
