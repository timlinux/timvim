-- Show lspsaga diagnostics popup on CursorHold in normal mode
vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    if vim.fn.mode() == "n" then
      vim.cmd("Lspsaga show_line_diagnostics ++unfocus")
    end
  end,
})
vim.o.updatetime = 500  -- Faster CursorHold
