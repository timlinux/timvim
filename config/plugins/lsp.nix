{
  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;
      formatOnSave = false; # Disabled to avoid conflict with conform
      lspSignature.enable = false;
      lspkind.enable = true;

      lspsaga = {
        enable = true;
        setupOpts = {
          lightbulb = {
            enable = false;
          };
        };
      };

      inlayHints.enable = true;
      lightbulb.enable = false;
      null-ls.enable = true;
    };

    ui.borders.plugins.lspsaga = {
      enable = true; # optional: enables pretty borders for saga
      style = "rounded"; # optional: pick your border style
    };
    # Source custom Lua for lspsaga CursorHold diagnostics popup (disabled by default)
    luaConfigRC.lspsaga_cursorhold = ''
      -- Global variable to track CursorHold diagnostic state
      _G.cursorhold_diagnostics_enabled = false

      -- Function to show diagnostic popup
      local function show_diagnostic_popup()
        if vim.fn.mode() == "n" then
          local winwidth = vim.api.nvim_get_option("columns")
          vim.diagnostic.open_float(nil, { 
            focus = false, 
            scope = "line",
            border = "rounded",
            max_width = 60,
            max_height = 60,
            anchor = "NE",
            row = 1,
            col = winwidth - 1,
            close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" }
          })
        end
      end

      -- CursorHold autocmd (initially disabled)
      local cursorhold_group = vim.api.nvim_create_augroup("CursorHoldDiagnostics", { clear = true })

      -- Function to toggle CursorHold diagnostics
      _G.toggle_cursorhold_diagnostics = function()
        _G.cursorhold_diagnostics_enabled = not _G.cursorhold_diagnostics_enabled
        
        -- Clear existing autocmds
        vim.api.nvim_clear_autocmds({ group = cursorhold_group })
        
        if _G.cursorhold_diagnostics_enabled then
          -- Enable CursorHold diagnostics
          vim.api.nvim_create_autocmd("CursorHold", {
            group = cursorhold_group,
            pattern = "*",
            callback = show_diagnostic_popup,
          })
          vim.notify("CursorHold diagnostics enabled", vim.log.levels.INFO)
        else
          vim.notify("CursorHold diagnostics disabled", vim.log.levels.INFO)
        end
      end

      vim.o.updatetime = 500  -- Faster CursorHold
    '';
  };
}
