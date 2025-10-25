{ ... }:

{
  vim = {
    # Python specific configuration
    pluginRC.python-setup = ''
      -- Python specific settings with spell checking
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'python',
        callback = function()
          local opt = vim.opt_local
          
          -- Enable spell checking for Python files
          opt.spell = true
          opt.spelllang = 'en_us'
          
          -- Configure spell checking to work only in strings and comments
          -- This uses Vim's syntax-based spell checking
          opt.spelloptions = 'camel'  -- Also check camelCase words
          
          -- Set up syntax-based spell checking for Python
          -- This will only spell check in strings, comments, and docstrings
          vim.cmd([[
            syntax spell toplevel
            " Enable spell checking in Python strings
            syn region pythonString start=+[bBfFrRuU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1" contains=@Spell,pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,pythonDocstring2,pythonUniString,pythonUniRawString,pythonRawString
            syn region pythonRawString start=+[bBfFrRuU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1" contains=@Spell,pythonSpaceError,pythonDocTest2,pythonUniRawEscape,pythonUniRawEscapeError
            syn region pythonDocString start=+^\s*[uUrR]\="""+ end=+"""+ keepend excludenl contains=@Spell,pythonEscape,pythonSpaceError,pythonDoctest,pythonTodo
            syn region pythonDocString start=+^\s*[uUrR]\='''+ end=+'''+ keepend excludenl contains=@Spell,pythonEscape,pythonSpaceError,pythonDoctest,pythonTodo
            " Enable spell checking in Python comments  
            syn match pythonComment "#.*$" contains=@Spell,pythonTodo,pythonSpaceError
            syn keyword pythonTodo TODO FIXME XXX contained
          ]])
          
          local map = vim.keymap.set
          
          -- Python-specific spell checking keybindings
          map('n', '<leader>zs', function()
            -- Toggle spell checking on/off (buffer-local for Python)
            vim.opt_local.spell = not vim.opt_local.spell:get()
            print('Python spell check: ' .. (vim.opt_local.spell:get() and 'enabled' or 'disabled'))
          end, { desc = 'Toggle Python Spell Check', buffer = true })
          
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
          
          -- Python-specific: Toggle spell check only in strings and comments
          map('n', '<leader>zt', function()
            -- This toggles between syntax-based spell checking and full spell checking
            local current_syntax = vim.fn.exists('b:current_syntax')
            local has_syntax = (current_syntax == 1)
            if has_syntax then
              vim.cmd('syntax clear')
              vim.opt_local.spell = false
              print('Python syntax spell check: disabled')
            else
              vim.cmd('set syntax=python')
              vim.opt_local.spell = true
              print('Python syntax spell check: enabled (strings/comments only)')
            end
          end, { desc = 'Toggle Syntax-based Spell Check', buffer = true })
          
        end,
        group = vim.api.nvim_create_augroup('PythonSpellSettings', { clear = true }),
      })
    '';
  };
}
