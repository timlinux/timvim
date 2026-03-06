{
  octo-plugin,
  pkgs,
  ...
}:
{
  vim = {
    extraPlugins = {
      octo = {
        package = octo-plugin;
        setup = ''
          require('octo').setup({
            default_remote = {"upstream", "origin"},
            picker = "telescope",
            picker_config = {
              use_emojis = true,
            },
            suppress_missing_scope = {
              projects_v2 = true,
            },
          })
        '';
      };
    };

    keymaps = [
      # GitHub Issues
      {
        key = "<leader>oil";
        action = "<cmd>Octo issue list<cr>";
        mode = "n";
        silent = true;
        desc = "List Issues";
      }
      {
        key = "<leader>ois";
        action = "<cmd>Octo issue search<cr>";
        mode = "n";
        silent = true;
        desc = "Search Issues";
      }
      {
        key = "<leader>oic";
        action = "<cmd>Octo issue create<cr>";
        mode = "n";
        silent = true;
        desc = "Create Issue";
      }
      {
        key = "<leader>oio";
        action = "<cmd>Octo issue browser<cr>";
        mode = "n";
        silent = true;
        desc = "Open in Browser";
      }

      # GitHub Pull Requests
      {
        key = "<leader>opl";
        action = "<cmd>Octo pr list<cr>";
        mode = "n";
        silent = true;
        desc = "List PRs";
      }
      {
        key = "<leader>ops";
        action = "<cmd>Octo pr search<cr>";
        mode = "n";
        silent = true;
        desc = "Search PRs";
      }
      {
        key = "<leader>opc";
        action = "<cmd>Octo pr create<cr>";
        mode = "n";
        silent = true;
        desc = "Create PR";
      }
      {
        key = "<leader>opo";
        action = "<cmd>Octo pr browser<cr>";
        mode = "n";
        silent = true;
        desc = "Open in Browser";
      }
      {
        key = "<leader>opd";
        action = "<cmd>Octo pr diff<cr>";
        mode = "n";
        silent = true;
        desc = "View Diff";
      }
      {
        key = "<leader>opf";
        action = "<cmd>Octo pr changes<cr>";
        mode = "n";
        silent = true;
        desc = "Changed Files";
      }
      {
        key = "<leader>opm";
        action = "<cmd>Octo pr merge<cr>";
        mode = "n";
        silent = true;
        desc = "Merge PR";
      }
      {
        key = "<leader>opC";
        action = "<cmd>Octo pr checkout<cr>";
        mode = "n";
        silent = true;
        desc = "Checkout PR";
      }

      # PR Review
      {
        key = "<leader>ors";
        action = "<cmd>Octo review start<cr>";
        mode = "n";
        silent = true;
        desc = "Start Review";
      }
      {
        key = "<leader>orr";
        action = "<cmd>Octo review resume<cr>";
        mode = "n";
        silent = true;
        desc = "Resume Review";
      }
      {
        key = "<leader>ora";
        action = "<cmd>Octo review submit approve<cr>";
        mode = "n";
        silent = true;
        desc = "Approve";
      }
      {
        key = "<leader>orx";
        action = "<cmd>Octo review submit request_changes<cr>";
        mode = "n";
        silent = true;
        desc = "Request Changes";
      }
      {
        key = "<leader>orc";
        action = "<cmd>Octo review submit comment<cr>";
        mode = "n";
        silent = true;
        desc = "Submit Comment";
      }
      {
        key = "<leader>ord";
        action = "<cmd>Octo review discard<cr>";
        mode = "n";
        silent = true;
        desc = "Discard Review";
      }

      # Comments
      {
        key = "<leader>oca";
        action = "<cmd>Octo comment add<cr>";
        mode = "n";
        silent = true;
        desc = "Add Comment";
      }
      {
        key = "<leader>ocd";
        action = "<cmd>Octo comment delete<cr>";
        mode = "n";
        silent = true;
        desc = "Delete Comment";
      }

      # Repo & Gist
      {
        key = "<leader>oRl";
        action = "<cmd>Octo repo list<cr>";
        mode = "n";
        silent = true;
        desc = "List Repos";
      }
      {
        key = "<leader>oRo";
        action = "<cmd>Octo repo browser<cr>";
        mode = "n";
        silent = true;
        desc = "Open Repo in Browser";
      }
      {
        key = "<leader>ogl";
        action = "<cmd>Octo gist list<cr>";
        mode = "n";
        silent = true;
        desc = "List Gists";
      }
    ];
  };
}
