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
        local conform = require("conform")
        local ft = vim.bo.filetype
        local formatters = conform.list_formatters(0)
        print("Filetype: " .. ft)
        print("Available formatters: " .. vim.inspect(formatters))
      end
    '';
  };
}
