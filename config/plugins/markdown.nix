{ ... }:

{
  vim = {
    # Markdown specific configuration
    pluginRC.markdown-setup = ''
      -- Markdown specific settings
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
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
