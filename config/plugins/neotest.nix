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

      vim.keymap.set("n", "<leader>Tr", function() neotest.run.run() end, { desc = "Run Nearest Test" })
      vim.keymap.set("n", "<leader>Tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run Tests in File" })
      vim.keymap.set("n", "<leader>Td", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Debug Nearest Test" })
      vim.keymap.set("n", "<leader>Tx", function() neotest.run.stop() end, { desc = "Stop Test Run" })
      vim.keymap.set("n", "<leader>To", function() neotest.output.open({ enter = true }) end, { desc = "Show Test Output" })
      vim.keymap.set("n", "<leader>Tp", function() neotest.output_panel.toggle() end, { desc = "Toggle Test Output Panel" })
      vim.keymap.set("n", "<leader>Ts", function() neotest.summary.toggle() end, { desc = "Toggle Test Summary" })
    '';
  };
}
