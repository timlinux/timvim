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

    luaConfigRC.spellfile_setup = ''
      -- Set spellfile to a writable location so zg/zw commands work
      local spell_dir = vim.fn.stdpath("data") .. "/spell"
      vim.fn.mkdir(spell_dir, "p")
      vim.opt.spellfile = spell_dir .. "/en.utf-8.add"

      -- Show spell suggestions popup when hovering a misspelled word
      _G.spell_autopopup_enabled = false
      local spell_dismissed = {}

      _G.toggle_spell_autopopup = function()
        _G.spell_autopopup_enabled = not _G.spell_autopopup_enabled
        spell_dismissed = {}
        vim.notify("Spell suggestion autopopup: " .. (_G.spell_autopopup_enabled and "enabled" or "disabled"), vim.log.levels.INFO)
      end

      vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
          if not _G.spell_autopopup_enabled then
            return
          end
          if not vim.opt_local.spell:get() then
            return
          end
          local word = vim.fn.expand("<cword>")
          if word == "" or spell_dismissed[word] then
            return
          end
          local bad = vim.fn.spellbadword(word)
          if bad[1] == "" then
            return
          end
          local suggestions = vim.fn.spellsuggest(bad[1], 10)
          if #suggestions == 0 then
            return
          end
          vim.ui.select(suggestions, { prompt = "Spelling: " .. bad[1] }, function(choice)
            if choice then
              vim.cmd("normal! ciw" .. choice)
              vim.cmd("stopinsert")
            else
              -- User dismissed without choosing; don't show again for this word
              spell_dismissed[word] = true
            end
          end)
        end,
      })
    '';

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
