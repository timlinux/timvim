{ pkgs, ... }:

{
  config.vim = {
    telescope = {
      enable = true;

      setupOpts = {
        defaults = {
          file_ignore_patterns = [ "__pycache__" ];
          preview = {
            # Enable chafa for image preview in telescope
            mime_hook = true;
          };
          vimgrep_arguments = [
            "${pkgs.ripgrep}/bin/rg"
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
            "--smart-case"
            "--hidden"
          ];
        };
        pickers = {
          live_grep = {
            additional_args = [ "--hidden" ];
          };
        };
      };

      extensions = [
        {
          name = "ui-select";
          packages = [ pkgs.vimPlugins.telescope-ui-select-nvim ];
          setup = {
            "ui-select" = { };
          };
        }
        {
          name = "file-browser";
          packages = [ pkgs.vimPlugins.telescope-file-browser-nvim ];
          setup = {
            "file-browser" = {
              theme = "ivy";
              hijack_netrw = true;
            };
          };
        }
        {
          name = "media-files";
          packages = [ pkgs.vimPlugins.telescope-media-files-nvim ];
          setup = {
            "media-files" = {
              filetypes = [
                "png"
                "webp"
                "jpg"
                "jpeg"
                "gif"
                "mp4"
                "webm"
                "pdf"
              ];
              find_cmd = "rg";
            };
          };
        }
      ];
    };

    # Custom Lua configuration for image previews
    luaConfigRC.telescope-image-previews = ''
      -- Custom image previewer using chafa
      local previewers = require('telescope.previewers')
      local utils = require('telescope.previewers.utils')
      local Job = require('plenary.job')

      local image_previewer = function(opts)
        return previewers.new_buffer_previewer {
          title = "Image Preview",
          define_preview = function(self, entry, status)
            local filepath = entry.path or entry.filename
            if not filepath then return end
            
            local extension = filepath:lower():match("%.([^%.]+)$")
            local image_extensions = {"png", "jpg", "jpeg", "gif", "webp", "bmp", "tiff"}
            
            local is_image = false
            for _, ext in ipairs(image_extensions) do
              if extension == ext then
                is_image = true
                break
              end
            end
            
            if is_image then
              Job:new({
                command = "chafa",
                args = {"--format=symbols", "--colors=256", "--size=80x24", filepath},
                on_exit = function(j, return_val)
                  if return_val == 0 then
                    vim.schedule(function()
                      local lines = j:result()
                      vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
                    end)
                  else
                    utils.set_preview_message(self.state.bufnr, self.state.winid, "Failed to preview image")
                  end
                end,
              }):start()
            else
              utils.set_preview_message(self.state.bufnr, self.state.winid, "Not an image file")
            end
          end
        }
      end

      -- Override media files extension with our custom previewer
      require('telescope').setup({
        extensions = {
          media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg", "gif", "bmp", "tiff", "mp4", "webm", "pdf"},
            find_cmd = "rg"
          }
        }
      })

      -- Load media files extension
      require('telescope').load_extension('media_files')

      -- Custom command for browsing media files with preview
      vim.api.nvim_create_user_command('TelescopeMediaFiles', function()
        -- Use find_files with media file patterns instead of the buggy extension
        require('telescope.builtin').find_files({
          find_command = {
            "${pkgs.ripgrep}/bin/rg", 
            "--files", 
            "--type-add", "media:*.{png,jpg,jpeg,gif,webp,bmp,tiff,mp4,webm,pdf,mov,avi,mkv}",
            "--type", "media"
          },
          previewer = image_previewer(),
          prompt_title = "Media Files",
        })
      end, {})

      -- Override the default media_files keymap to use our custom command with preview
      vim.keymap.set('n', '<leader>fm', '<cmd>TelescopeMediaFiles<cr>', { desc = 'Find Media Files with Preview' })

      -- Debug live_grep functionality
      vim.api.nvim_create_user_command('DebugLiveGrep', function()
        local builtin = require('telescope.builtin')
        print("Ripgrep path: ${pkgs.ripgrep}/bin/rg")
        print("Current working directory: " .. vim.fn.getcwd())
        builtin.live_grep({
          cwd = vim.fn.getcwd(),
          prompt_title = "Live Grep (Debug)",
        })
      end, {})

      -- Ensure live_grep works with proper configuration
      vim.keymap.set('n', '<leader>fg', function()
        require('telescope.builtin').live_grep({
          cwd = vim.fn.getcwd(),
          additional_args = function(opts)
            return {"--hidden", "--glob", "!.git/*", "--fixed-strings"}
          end,
        })
      end, { desc = 'Live Grep Files (Fixed Strings)' })

      -- Add a regex version for when you need pattern matching
      vim.keymap.set('n', '<leader>fG', function()
        require('telescope.builtin').live_grep({
          cwd = vim.fn.getcwd(),
          additional_args = function(opts)
            return {"--hidden", "--glob", "!.git/*"}
          end,
        })
      end, { desc = 'Live Grep Files (Regex)' })
    '';
  };
}
