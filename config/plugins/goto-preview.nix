{ pkgs, ... }:
{
  vim = {
    startPlugins = with pkgs.vimPlugins; [
      goto-preview
    ];

    pluginRC.goto-preview = ''
      require("goto-preview").setup({
        width = 120,
        height = 25,
        border = "rounded",
        dismiss_on_move = false,
        stack_floating_preview_windows = true,
      })

      vim.keymap.set("n", "gpd", function() require("goto-preview").goto_preview_definition() end, { desc = "Preview Definition" })
      vim.keymap.set("n", "gpt", function() require("goto-preview").goto_preview_type_definition() end, { desc = "Preview Type Definition" })
      vim.keymap.set("n", "gpi", function() require("goto-preview").goto_preview_implementation() end, { desc = "Preview Implementation" })
      vim.keymap.set("n", "gpr", function() require("goto-preview").goto_preview_references() end, { desc = "Preview References" })
      vim.keymap.set("n", "gP", function() require("goto-preview").close_all_win() end, { desc = "Close All Previews" })
    '';
  };
}
