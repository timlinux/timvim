{ ... }:
{
  vim = {
    assistant.copilot = {
      enable = true;
      cmp.enable = false; # Ghost text only, completion menu uses other sources
      setupOpts = {
        suggestion = {
          enabled = true; # Enable native suggestions for ghost text on current line
          auto_trigger = false; # Only trigger manually via Ctrl+y
          debounce = 75; # Fast response when manually triggered
          keymap = {
            accept = false; # Handled by custom smart keymap below
            accept_word = "<M-w>"; # Alt+w to accept next word
            accept_line = "<M-e>"; # Alt+e to accept current line
            next = "<M-]>"; # Next suggestion (Alt+])
            prev = "<M-[>"; # Previous suggestion (Alt+[)
            dismiss = "<C-]>"; # Dismiss suggestion
            toggle = "<M-\\>"; # Alt+\ to toggle copilot suggestions manually
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

    # Smart Ctrl+y: trigger suggestion if none visible, accept if visible
    luaConfigRC.copilot-smart-accept = ''
      vim.keymap.set("i", "<C-y>", function()
        local suggestion = require("copilot.suggestion")
        if suggestion.is_visible() then
          suggestion.accept()
        else
          suggestion.next()
        end
      end, { desc = "Copilot: trigger or accept suggestion", silent = true })
    '';
  };
}
