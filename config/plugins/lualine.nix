{ pkgs, ... }:
{
  vim = {

    statusline = {
      lualine = {
        enable = true;
        theme = "auto";
        icons.enable = true;
        disabledFiletypes = [ "alpha" ];
      };
    };
    luaConfigRC = {
      lualine_kartoza = ''
        -- Kartoza lualine theme
        local colors = {
          bg       = "#1e2020",
          fg       = "#f1f1f1",
          yellow   = "#ecb44b",
          cyan     = "#85b0c8",
          darkblue = "#57a0c7",
          green    = "#8ad384",
          orange   = "#eb8444",
          violet   = "#56f341",
          magenta  = "#57a0c7",
          blue     = "#f8faf6",
          red      = "#c13022"
        }
        local kartoza = {
          normal = {
            a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          insert = {
            a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          visual = {
            a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          replace = {
            a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          command = {
            a = { fg = colors.bg, bg = colors.orange, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.darkblue },
            c = { fg = colors.fg, bg = colors.bg },
          },
          inactive = {
            a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
            b = { fg = colors.fg, bg = colors.bg },
            c = { fg = colors.fg, bg = colors.bg },
          },
        }
        -- Global variable to track last yanked register
        vim.g.last_yanked_register = ""
        vim.g.yank_timer = nil

        -- Function to show yank indicator temporarily
        local function show_yank_indicator(register)
          vim.g.last_yanked_register = register
          if vim.g.yank_timer then
            vim.fn.timer_stop(vim.g.yank_timer)
          end
          vim.g.yank_timer = vim.fn.timer_start(3000, function()
            vim.g.last_yanked_register = ""
            vim.g.yank_timer = nil
            vim.cmd('redrawstatus')
          end)
          vim.cmd('redrawstatus')
        end

        -- Set up autocmd for yank detection
        vim.api.nvim_create_autocmd("TextYankPost", {
          callback = function()
            local event = vim.v.event
            if event.regname and event.regname ~= "" then
              show_yank_indicator(event.regname)
            else
              -- Default register is "
              show_yank_indicator('"')
            end
          end,
        })

        require('lualine').setup {
          options = { theme = kartoza },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {
              {
                function()
                  local recording_register = vim.fn.reg_recording()
                  if recording_register == "" then
                    return ""
                  else
                    return "Recording @" .. recording_register
                  end
                end,
                color = { fg = colors.bg, bg = colors.red, gui = 'bold' },
              },
              {
                function()
                  if vim.g.last_yanked_register and vim.g.last_yanked_register ~= "" then
                    return "Yanked @" .. vim.g.last_yanked_register
                  else
                    return ""
                  end
                end,
                color = { fg = colors.bg, bg = colors.green, gui = 'bold' },
              },
              'encoding', 'fileformat', 'filetype'
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
          }
        }
      '';
    };
  };
}
