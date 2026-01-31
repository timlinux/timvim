{ pkgs, ... }:
{
  vim.extraPlugins.oil = {
    package = pkgs.vimPlugins.oil-nvim;
    setup = ''
      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        default_file_explorer = true,
        
        -- Columns to show
        columns = {
          "icon",
          "permissions",
          "size",
          "mtime",
        },
        
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        
        -- Delete to trash instead of permanently deleting
        delete_to_trash = true,
        
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = false,
        
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        prompt_save_on_select_new_entry = true,
        
        -- Oil will automatically delete hidden buffers after this delay
        cleanup_delay_ms = 2000,
        
        -- Constrain the cursor to the editable parts of the oil buffer
        constrain_cursor = "editable",
        
        -- Set to true to watch the filesystem for changes and reload oil
        watch_for_changes = false,
        
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          override = function(conf)
            return conf
          end,
        },
        
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          max_height = 0.9,
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
          -- Whether the preview window is automatically updated when the cursor is moved
          update_on_cursor_moved = true,
        },
        
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
        
        -- Configuration for the floating SSH window
        ssh = {
          border = "rounded",
        },
      })
    '';
  };

  # Add custom image preview functionality
  vim.luaConfigRC.image-preview = ''
    -- Custom image preview function using chafa
    local function preview_image(filepath)
      if not filepath then
        local ok, oil = pcall(require, "oil")
        if not ok then
          vim.notify("Oil plugin not available", vim.log.levels.ERROR)
          return
        end

        local entry = oil.get_cursor_entry()
        if not entry or entry.type ~= "file" then
          vim.notify("No file selected or not a file", vim.log.levels.WARN)
          return
        end
        filepath = oil.get_current_dir() .. entry.name
      end

      if vim.fn.filereadable(filepath) ~= 1 then
        vim.notify("File not readable: " .. filepath, vim.log.levels.ERROR)
        return
      end

      local extension = filepath:lower():match("%.([^%.]+)$")
      local image_extensions = {"png", "jpg", "jpeg", "gif", "webp", "bmp", "tiff"}

      local is_image = false
      for _, ext in ipairs(image_extensions) do
        if extension == ext then
          is_image = true
          break
        end
      end

      if not is_image then
        vim.notify("Not an image file", vim.log.levels.WARN)
        return
      end

      local buf = vim.api.nvim_create_buf(false, true)
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)

      local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = math.floor((vim.o.columns - width) / 2),
        row = math.floor((vim.o.lines - height) / 2),
        style = "minimal",
        border = "rounded",
        title = " Image Preview: " .. vim.fn.fnamemodify(filepath, ":t") .. " ",
        title_pos = "center"
      })

      vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Loading image preview..."})

      local chafa_width = math.min(width - 4, 80)
      local chafa_height = math.min(height - 4, 30)

      vim.system(
        {"chafa", "--format=symbols", "--colors=256", "--size=" .. chafa_width .. "x" .. chafa_height, filepath},
        { text = true },
        vim.schedule_wrap(function(result)
          if not vim.api.nvim_buf_is_valid(buf) then return end
          if result.code == 0 and result.stdout and #result.stdout > 0 then
            local lines = vim.split(result.stdout, '\n')
            if lines[#lines] == "" then
              table.remove(lines)
            end
            if #lines > 0 then
              vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
            else
              vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Chafa produced no output"})
            end
          else
            vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
              "Error running chafa (exit code: " .. (result.code or "?") .. ")",
              "Is chafa installed?"
            })
          end
        end)
      )

      local function close_preview()
        if vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
        end
      end

      vim.keymap.set("n", "q", close_preview, { buffer = buf, desc = "Close image preview" })
      vim.keymap.set("n", "<Esc>", close_preview, { buffer = buf, desc = "Close image preview" })
      vim.keymap.set("n", "<C-c>", close_preview, { buffer = buf, desc = "Close image preview" })
    end

    vim.api.nvim_create_user_command("ImagePreview", function(opts)
      preview_image(opts.args ~= "" and opts.args or nil)
    end, {
      desc = "Preview image file with chafa",
      nargs = "?",
      complete = "file"
    })

    vim.keymap.set("n", "<leader>pi", function()
      preview_image()
    end, { desc = "Preview Image" })

  '';
}
