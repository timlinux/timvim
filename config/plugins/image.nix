{ ... }:

{
  # See https://github.com/3rd/image.nvim
  # This configures additional keymaps for markdown image support
  # The main image.nvim plugin is configured in config/utility/image-nvim.nix
  vim = {
    pluginRC.markdown-image-keymaps = ''
      -- Additional image.nvim keymaps for markdown
      local function setup_markdown_image_keymaps()
        local map = vim.keymap.set
        -- Toggle image rendering in markdown files
        map('n', '<leader>tI', function()
          require('image').toggle()
        end, { desc = 'Toggle Image Rendering', buffer = true })
        
        -- Clear images in current buffer
        map('n', '<leader>ci', function()
          require('image').clear()
        end, { desc = 'Clear Images', buffer = true })
      end

      -- Set up keymaps for markdown files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = setup_markdown_image_keymaps,
        group = vim.api.nvim_create_augroup('MarkdownImages', { clear = true }),
      })
    '';
  };
}
