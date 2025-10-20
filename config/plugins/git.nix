{ ... }:

{
  vim = {

    git = {
      enable = true;
      gitsigns = {
        enable = true;
        codeActions.enable = true; # Was too intrusive
        mappings = {
          blameLine = "<leader>gb";
          toggleBlame = "<leader>gx";
        };
      };
    };

    pluginRC.gitsigns = ''
      local gs = require("gitsigns")
      gs.setup {
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
        on_attach = function(bufnr)
          local map = vim.keymap.set
          
          -- First, delete any existing gitsigns keymaps
          pcall(vim.keymap.del, 'n', 'd', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'D', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'P', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'r', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'R', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 's', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'S', { buffer = bufnr })
          pcall(vim.keymap.del, 'n', 'u', { buffer = bufnr })
          
          -- Git blame keybinds (already configured)
          map('n', '<leader>gb', gs.blame_line, { buffer = bufnr, desc = "Toggle Git Blame Line" })
          
          -- Git hunk operations 
          map('n', '<leader>gs', gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
          map('n', '<leader>gr', gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
          map('n', '<leader>gS', gs.stage_buffer, { buffer = bufnr, desc = "Stage Buffer" })
          map('n', '<leader>gR', gs.reset_buffer, { buffer = bufnr, desc = "Reset Buffer" })
          map('n', '<leader>gu', gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo Stage Hunk" })
          map('n', '<leader>gp', gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
          map('n', '<leader>gd', gs.diffthis, { buffer = bufnr, desc = "Diff This" })
          map('n', '<leader>gD', function() gs.diffthis('~') end, { buffer = bufnr, desc = "Diff Project" })
          
          -- Visual mode stage/reset hunk
          map('v', '<leader>gs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = "Stage Selected Hunk" })
          map('v', '<leader>gr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { buffer = bufnr, desc = "Reset Selected Hunk" })
          
          -- Git conflict resolution keybinds
          map('n', '<leader>gn', '<cmd>GitConflictChooseNone<CR>', { buffer = bufnr, desc = "Git Choose None" })
          map('n', '<leader>gt', '<cmd>GitConflictChooseTheirs<CR>', { buffer = bufnr, desc = "Git Choose Theirs" })
          map('n', '<leader>gc', '<cmd>GitConflictChooseOurs<CR>', { buffer = bufnr, desc = "Git Choose Ours" })
          map('n', '<leader>ga', '<cmd>GitConflictChooseBoth<CR>', { buffer = bufnr, desc = "Git Choose Both" })
        end,
      }
    '';
  };
}
