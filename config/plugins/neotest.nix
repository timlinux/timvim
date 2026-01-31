{ pkgs, ... }:
{
  vim = {
    startPlugins = with pkgs.vimPlugins; [
      neotest
      neotest-python
      neotest-go
      neotest-rust
      nvim-nio
    ];

    pluginRC.neotest = ''
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
          }),
          require("neotest-go"),
          require("neotest-rust"),
        },
      })

      vim.keymap.set("n", "<leader>xr", function() neotest.run.run() end, { desc = "Run Nearest Test" })
      vim.keymap.set("n", "<leader>xf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run Tests in File" })
      vim.keymap.set("n", "<leader>xd", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Debug Nearest Test" })
      vim.keymap.set("n", "<leader>xx", function() neotest.run.stop() end, { desc = "Stop Test Run" })
      vim.keymap.set("n", "<leader>xo", function() neotest.output.open({ enter = true }) end, { desc = "Show Test Output" })
      vim.keymap.set("n", "<leader>xp", function() neotest.output_panel.toggle() end, { desc = "Toggle Test Output Panel" })
      vim.keymap.set("n", "<leader>xS", function() neotest.summary.toggle() end, { desc = "Toggle Test Summary" })
    '';
  };
}
