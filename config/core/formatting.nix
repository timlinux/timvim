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

      -- Smart Tab handler for Copilot and nvim-cmp integration
      _G.smart_tab = function()
        -- Priority 1: If nvim-cmp menu is visible, confirm selection  
        local cmp = require('cmp')
        if cmp.visible() then
          cmp.confirm({ select = true })
          return
        end
        
        -- Priority 2: Try to let Copilot handle Tab
        -- Just send Tab and let Copilot intercept if it has a suggestion
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "m", false)
      end

      -- Global quick spell fix function
      _G.quick_spell_fix = function()
        -- Check if spell checking is enabled
        if not vim.opt.spell:get() then
          print('Spell checking is not enabled. Use <leader>ss to enable it.')
          return
        end
        
        -- Get the word under cursor
        local word = vim.fn.expand('<cword>')
        
        -- Check if word is misspelled
        local badword = vim.fn.spellbadword(word)[1]
        if badword ~= "" then
          -- Get suggestions
          local suggestions = vim.fn.spellsuggest(word, 1)
          if #suggestions > 0 then
            -- Replace with first suggestion
            vim.cmd("normal! ciw" .. suggestions[1])
            print("Replaced '" .. word .. "' with '" .. suggestions[1] .. "'")
          else
            print("No suggestions found for '" .. word .. "'")
          end
        else
          print("Word '" .. word .. "' is spelled correctly")
        end
      end
    '';
  };
}
