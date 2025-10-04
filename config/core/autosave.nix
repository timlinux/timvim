{ ... }:
{
  vim = {
    luaConfigRC.autosave = ''
      -- Auto-save configuration
      local autosave_group = vim.api.nvim_create_augroup("AutoSave", { clear = true })

      -- Auto-save on various events
      vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        group = autosave_group,
        pattern = "*",
        callback = function()
          -- Only save if the buffer is modifiable and has been modified
          if vim.bo.modifiable and vim.bo.modified and vim.bo.buftype == "" then
            -- Don't save certain file types
            local ft = vim.bo.filetype
            local excluded_filetypes = { "gitcommit", "gitrebase", "fugitive" }
            
            for _, excluded in ipairs(excluded_filetypes) do
              if ft == excluded then
                return
              end
            end
            
            -- Save the file
            vim.cmd("silent! write")
          end
        end,
      })

      -- Auto-save when focus is lost
      vim.api.nvim_create_autocmd({ "FocusLost" }, {
        group = autosave_group,
        pattern = "*",
        callback = function()
          vim.cmd("silent! wall")  -- Save all modified buffers
        end,
      })

      -- Visual feedback for autosave (optional)
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = autosave_group,
        pattern = "*",
        callback = function()
          -- Brief message that file was saved
          vim.defer_fn(function()
            vim.api.nvim_echo({ { "File saved", "MoreMsg" } }, false, {})
          end, 100)
        end,
      })
    '';
  };
}
