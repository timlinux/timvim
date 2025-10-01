{
  vim = {
    lsp = {
      enable = true;
      lspconfig.enable = true;
      formatOnSave = true;
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
    # Source custom Lua for lspsaga CursorHold diagnostics popup
    luaConfigRC.lspsaga_cursorhold = ''
            vim.api.nvim_create_autocmd("CursorHold", {
        pattern = "*",
        callback = function()
          if vim.fn.mode() == "n" then
            vim.diagnostic.open_float(nil, { 
              focus = false, 
              scope = "line",
              border = "rounded",
              max_width = 80,
              max_height = 20,
              close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" }
            })
          end
        end,
      })
      vim.o.updatetime = 500  -- Faster CursorHold
    '';
  };
}
