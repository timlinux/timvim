{ pkgs, ... }:
{
  vim.extraPlugins.persistent-breakpoints = {
    package = pkgs.vimPlugins.persistent-breakpoints-nvim;
    setup = ''
      require("persistent-breakpoints").setup({
        save_dir = vim.fn.stdpath("data") .. "/breakpoints",
        -- Load breakpoints when a buffer is opened
        load_breakpoints_event = { "BufReadPost" },
        -- Integrate with nvim-dap
        perf_record = false,
      })
    '';
  };

  vim.luaConfigRC.persistent-breakpoints-keymaps = ''
    local pb_api = require("persistent-breakpoints.api")

    -- Override default breakpoint keymaps to use persistent versions
    vim.keymap.set("n", "<leader>db", pb_api.toggle_breakpoint, { desc = "Toggle Breakpoint (persistent)" })
    vim.keymap.set("n", "<F8>", pb_api.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint (persistent)" })
    vim.keymap.set("n", "<S-F8>", pb_api.clear_all_breakpoints, { desc = "Debug: Clear All Breakpoints" })

    -- Conditional breakpoint
    vim.keymap.set("n", "<leader>dB", function()
      pb_api.set_conditional_breakpoint()
    end, { desc = "Set Conditional Breakpoint" })

    -- Logpoint (breakpoint that logs a message)
    vim.keymap.set("n", "<leader>dL", function()
      pb_api.set_log_point()
    end, { desc = "Set Log Point" })
  '';
}
