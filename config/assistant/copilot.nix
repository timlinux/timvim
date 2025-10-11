{ pkgs, ... }:
{
  vim = {
    startPlugins = [
      pkgs.vimPlugins.CopilotChat-nvim
    ];

    pluginRC.copilot-chat = ''
      require("CopilotChat").setup({
        debug = false,
        window = {
          layout = 'vertical',
          width = 0.5,
          height = 0.5,
          relative = 'editor',
          border = 'single',
          title = 'Copilot Chat',
          zindex = 1,
        },
        mappings = {
          complete = {
            detail = 'Use @<Tab> or /<Tab> for options.',
            insert = '<Tab>',
          },
          close = {
            normal = 'q',
            insert = '<C-c>'
          },
          reset = {
            normal = '<C-x>',
            insert = '<C-x>'
          },
          submit_prompt = {
            normal = '<CR>',
            insert = '<C-s>'
          },
          accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>'
          },
          yank_diff = {
            normal = 'gy',
          },
          show_diff = {
            normal = 'gd'
          },
          show_system_prompt = {
            normal = 'gp'
          },
          show_user_selection = {
            normal = 'gs'
          }
        },
      })
    '';

    assistant.copilot = {
      enable = true;
      cmp.enable = true; # Enable copilot suggestions in completion menu
      setupOpts = {
        suggestion = {
          enabled = true; # Enable native suggestions for ghost text
          auto_trigger = true;
          keymap = {
            accept = "<Tab>"; # Let Copilot handle Tab for ghost text
            accept_word = "<M-w>"; # Alt+w to accept next word
            accept_line = "<M-e>"; # Alt+e to accept current line
            next = "<M-]>"; # Next suggestion (Alt+])
            prev = "<M-[>"; # Previous suggestion (Alt+[)
            dismiss = "<C-]>"; # Dismiss suggestion
          };
        };
        panel = {
          enabled = true;
          auto_refresh = false;
          keymap = {
            jump_prev = "[[";
            jump_next = "]]";
            accept = "<CR>";
            refresh = "gr";
            open = "<M-CR>"; # Alt+Enter to open panel
          };
          layout = {
            position = "bottom";
            ratio = 0.4;
          };
        };
        filetypes = {
          yaml = false;
          markdown = false;
          help = false;
          gitcommit = false;
          gitrebase = false;
          hgcommit = false;
          svn = false;
          cvs = false;
          "." = false;
        };
        copilot_node_command = "node";
        server_opts_overrides = { };
      };
    };
  };
}
