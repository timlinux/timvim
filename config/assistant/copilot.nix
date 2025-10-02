{
  vim.assistant.copilot = {
    enable = true;
    cmp.enable = true; # Enable copilot suggestions in completion menu
    setupOpts = {
      suggestion = {
        enabled = true;
        auto_trigger = true;
        keymap = {
          accept = "<Tab>"; # Accept suggestion with Tab
          accept_word = "<C-Right>"; # Accept next word
          accept_line = "<C-l>"; # Accept current line
          next = "<M-]>"; # Next suggestion (Alt+])
          prev = "<M-[>"; # Previous suggestion (Alt+[)
          dismiss = "<C-h>"; # Dismiss suggestion
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
}
