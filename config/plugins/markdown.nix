{ ... }:

{
  vim = {
    # Markdown specific configuration
    pluginRC.markdown-setup = ''
      -- Markdown specific settings
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          -- Register markdown group with which-key for this buffer only
          local ok, wk = pcall(require, "which-key")
          if ok then
            wk.add({
              { "<leader>m", group = "  Markdown", buffer = 0 },
            })
          end

          local opt = vim.opt_local

          -- Enable text wrapping for markdown files
          opt.wrap = true
          opt.linebreak = true
          opt.textwidth = 80
          
          -- Better visual indentation
          opt.breakindent = true
          opt.breakindentopt = 'shift:2,min:20'
          
          -- Spell checking for markdown
          opt.spell = true
          opt.spelllang = 'en_us'
          
          -- Concealing for better markdown display
          opt.conceallevel = 2
          opt.concealcursor = 'nc'
          
          -- Auto-format on save (handled by conform.nvim)
          local map = vim.keymap.set
          
          -- Manual format shortcut
          map('n', '<leader>mf', function()
            vim.cmd('Format')
          end, { desc = 'Format Markdown', buffer = true })
          
          -- Toggle word wrap
          map('n', '<leader>mw', function()
            vim.wo.wrap = not vim.wo.wrap
            print('Word wrap: ' .. (vim.wo.wrap and 'enabled' or 'disabled'))
          end, { desc = 'Toggle Word Wrap', buffer = true })
          
          -- Insert current date
          map('n', '<leader>md', function()
            local date = os.date('%Y-%m-%d')
            vim.api.nvim_put({date}, 'c', true, true)
          end, { desc = 'Insert Date', buffer = true })
          
          -- Insert markdown link template
          map('n', '<leader>ml', function()
            vim.api.nvim_put({'[text](url)'}, 'c', true, true)
          end, { desc = 'Insert Link Template', buffer = true })
          
          -- Insert markdown image template
          map('n', '<leader>mi', function()
            vim.api.nvim_put({'![alt text](image_path)'}, 'c', true, true)
          end, { desc = 'Insert Image Template', buffer = true })

          -- Toggle markdown preview
          map('n', '<leader>mp', function()
            vim.cmd('MarkdownPreviewToggle')
          end, { desc = 'Toggle Markdown Preview', buffer = true })

          -- Spell checking keybindings (markdown-specific overrides)
          map('n', '<leader>zs', function()
            -- Toggle spell checking on/off (buffer-local for markdown)
            vim.opt_local.spell = not vim.opt_local.spell:get()
            print('Markdown spell check: ' .. (vim.opt_local.spell:get() and 'enabled' or 'disabled'))
          end, { desc = 'Toggle Markdown Spell Check', buffer = true })
          
          -- Show spell suggestions for word under cursor
          map('n', '<leader>z=', 'z=', { desc = 'Show Spell Suggestions', buffer = true })
          
          -- Add word under cursor to spellfile (personal dictionary)
          map('n', '<leader>za', 'zg', { desc = 'Add Word to Dictionary', buffer = true })
          
          -- Mark word under cursor as incorrect (add to bad words)
          map('n', '<leader>zb', 'zw', { desc = 'Mark Word as Bad', buffer = true })
          
          -- Remove word from spellfile
          map('n', '<leader>zr', 'zug', { desc = 'Remove Word from Dictionary', buffer = true })
          
          -- Navigate to next misspelled word
          map('n', ']s', ']s', { desc = 'Next Misspelled Word', buffer = true })
          
          -- Navigate to previous misspelled word
          map('n', '[s', '[s', { desc = 'Previous Misspelled Word', buffer = true })
          
          -- Quick fix: replace with first suggestion
          map('n', '<leader>zf', function()
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
          end, { desc = 'Quick Fix with First Suggestion', buffer = true })
        end,
        group = vim.api.nvim_create_augroup('MarkdownSettings', { clear = true }),
      })

      -- Auto-save on markdown files when leaving insert mode or focus
      vim.api.nvim_create_autocmd({'InsertLeave', 'FocusLost'}, {
        pattern = '*.md',
        callback = function()
          if vim.bo.modified and not vim.bo.readonly and vim.fn.expand('%') ~= "" then
            vim.cmd('silent! write')
          end
        end,
        group = vim.api.nvim_create_augroup('MarkdownAutoSave', { clear = true }),
      })
    '';
  };
}
