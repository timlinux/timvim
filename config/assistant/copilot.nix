{ ... }:
{
  vim = {
    assistant.copilot = {
      enable = true;
      cmp.enable = false; # Ghost text only, completion menu uses other sources
      setupOpts = {
        suggestion = {
          enabled = true; # Enable native suggestions for ghost text on current line
          auto_trigger = true;
          debounce = 500; # Faster response for ghost text
          keymap = {
            accept = "<M-Tab>"; # Alt+Tab to accept ghost text (avoid conflict with completion)
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
