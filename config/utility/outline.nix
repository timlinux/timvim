{
  vim.utility = {
    outline = {
      aerial-nvim = {
        enable = true;
        mappings = {
          toggle = "<leader>to";
        };
      };
    };
  };

  # Open Aerial automatically when entering a buffer with LSP support
  vim.luaConfigRC.aerial-autoopen = ''
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        -- Only open if not already open and buffer has symbols
        vim.defer_fn(function()
          if vim.api.nvim_buf_is_valid(bufnr) then
            -- Skip alpha dashboard and other special buffers
            local filetype = vim.bo[bufnr].filetype
            local buftype = vim.bo[bufnr].buftype
            if filetype == "alpha" or filetype == "" or buftype == "nofile" then
              return
            end
            local aerial = require("aerial")
            -- Open aerial if it's not already open
            if not aerial.is_open() then
              aerial.open({ focus = false })
              _G.toggle_states['<leader>to'] = true
              if _G.update_toggle_desc then
                _G.update_toggle_desc('<leader>to', 'Code Outline', true)
              end
            end
          end
        end, 500)
      end,
    })

    -- Close Aerial when entering buffers that don't support outline
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function(args)
        local bufnr = args.buf
        vim.defer_fn(function()
          if not vim.api.nvim_buf_is_valid(bufnr) then
            return
          end
          local filetype = vim.bo[bufnr].filetype
          local buftype = vim.bo[bufnr].buftype

          -- Check if this buffer has an LSP client attached
          local clients = vim.lsp.get_clients({ bufnr = bufnr })
          local has_lsp = #clients > 0

          -- Close aerial for unsupported buffers (no LSP, special buffers, etc.)
          local is_special = filetype == "alpha" or filetype == "" or
                            filetype == "aerial" or filetype == "neo-tree" or
                            filetype == "toggleterm" or filetype == "help" or
                            buftype == "nofile" or buftype == "terminal" or
                            buftype == "prompt" or buftype == "quickfix"

          if is_special or not has_lsp then
            local aerial = require("aerial")
            if aerial.is_open() then
              aerial.close()
              _G.toggle_states['<leader>to'] = false
              if _G.update_toggle_desc then
                _G.update_toggle_desc('<leader>to', 'Code Outline', false)
              end
            end
          end
        end, 100)
      end,
    })
  '';
}
