{
  vim = {
    globals = {
      mapleader = " ";
    };
    options = {
      # Numbering
      number = true;
      relativenumber = true;

      # Cursor line highlighting
      cursorline = true;
      cursorlineopt = "both"; # Highlight the line and the number

      # Tab Settings
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      # Indentation
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;

      # Fold Settings
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = false;

      shada = "!,'100,<50,s10,h";
      #shadafile = "NONE";

      # Autosave settings
      autowrite = true; # Auto-save when switching buffers
      autowriteall = true; # Auto-save on more events
      updatetime = 500; # CursorHold delay and swap file write (single authoritative value)

      wrap = false;
    };

    # Restore cursor position when opening files
    luaConfigRC.restore_cursor = ''
      -- Restore cursor position when opening files
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = "*",
        callback = function()
          local line = vim.fn.line("'\"")
          if line > 1 and line <= vim.fn.line("$") and vim.bo.filetype ~= "commit" then
            vim.cmd('normal! g`"')
          end
        end,
      })
    '';
  };
}
