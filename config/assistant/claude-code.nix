{ claude-code-plugin, ... }:
{
  vim = {
    extraPlugins = {
      claude-code = {
        package = claude-code-plugin;
        setup = ''
          require('claudecode').setup({
            -- Optional configuration
            server = {
              host = "localhost",
              port = 9000,
            },
            -- Enable automatic startup of the server
            auto_start = true,
          })
        '';
      };
    };

    keymaps = [
      {
        key = "<leader>ac";
        action = "<cmd>ClaudeCode<cr>";
        mode = "n";
        silent = true;
        desc = "Toggle Claude Code";
      }
      {
        key = "<leader>af";
        action = "<cmd>ClaudeCodeFocus<cr>";
        mode = "n";
        silent = true;
        desc = "Focus Claude Code";
      }
      {
        key = "<leader>am";
        action = "<cmd>ClaudeCodeSelectModel<cr>";
        mode = "n";
        silent = true;
        desc = "Select Claude Model";
      }
      {
        key = "<leader>as";
        action = "<cmd>ClaudeCodeSend<cr>";
        mode = "v";
        silent = true;
        desc = "Send Selection to Claude";
      }
    ];

    # Note: Copilot is now configured separately in copilot.nix for inline completion
    # Claude Code handles chat functionality
  };
}
