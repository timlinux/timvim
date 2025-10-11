{ ... }:
{
  vim = {
    luaConfigRC.formatting = ''
      -- Manual format function
      _G.format_buffer = function()
        local conform = require("conform")
        local success, err = pcall(function()
          conform.format({
            lsp_fallback = true,
            timeout_ms = 2000,
          })
        end)
        
        if success then
          print("Buffer formatted successfully")
        else
          print("Formatting failed: " .. tostring(err))
        end
      end

      -- Debug function to check available formatters
      _G.check_formatters = function()
        local ft = vim.bo.filetype
        local formatters = conform.list_formatters(0)
        vim.notify("Filetype: " .. ft, vim.log.levels.INFO)
        vim.notify("Available formatters: " .. vim.inspect(formatters), vim.log.levels.INFO)
      end

      -- Smart Tab handler for Copilot and blink-cmp integration
      _G.smart_tab = function()
        -- Priority 1: If blink-cmp menu is visible, confirm selection  
        local ok, blink = pcall(require, 'blink.cmp')
        if ok and blink.is_visible() then
          blink.accept()
          return
        end
        
        -- Priority 2: Try to let Copilot handle Tab
        -- Just send Tab and let Copilot intercept if it has a suggestion
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "m", false)
      end
    '';
  };
}
