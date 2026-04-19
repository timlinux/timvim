# ThePrimeagen's refactoring.nvim
# Provides code refactoring operations like extract function/variable, inline, etc.
{ pkgs, ... }:
{
  vim = {
    extraPlugins = {
      refactoring = {
        package = pkgs.vimPlugins.refactoring-nvim;
        setup = ''
          require('refactoring').setup({
            prompt_func_return_type = {
              go = true,
              cpp = true,
              c = true,
              java = true,
              python = true,
              javascript = true,
              typescript = true,
            },
            prompt_func_param_type = {
              go = true,
              cpp = true,
              c = true,
              java = true,
              python = true,
              javascript = true,
              typescript = true,
            },
          })
        '';
      };
    };

    keymaps = [
      # Visual mode refactoring operations
      {
        key = "<leader>re";
        mode = "v";
        silent = true;
        action = "<cmd>Refactor extract<CR>";
        desc = "󰆧 Extract Function";
      }
      {
        key = "<leader>rf";
        mode = "v";
        silent = true;
        action = "<cmd>Refactor extract_to_file<CR>";
        desc = "󰈙 Extract to File";
      }
      {
        key = "<leader>rv";
        mode = "v";
        silent = true;
        action = "<cmd>Refactor extract_var<CR>";
        desc = " Extract Variable";
      }
      {
        key = "<leader>ri";
        mode = [
          "n"
          "v"
        ];
        silent = true;
        action = "<cmd>Refactor inline_var<CR>";
        desc = "󰗈 Inline Variable";
      }
      # Normal mode refactoring operations
      {
        key = "<leader>rI";
        mode = "n";
        silent = true;
        action = "<cmd>Refactor inline_func<CR>";
        desc = "󰗈 Inline Function";
      }
      {
        key = "<leader>rb";
        mode = "n";
        silent = true;
        action = "<cmd>Refactor extract_block<CR>";
        desc = "󰆧 Extract Block";
      }
      {
        key = "<leader>rB";
        mode = "n";
        silent = true;
        action = "<cmd>Refactor extract_block_to_file<CR>";
        desc = "󰈙 Extract Block to File";
      }
      # Refactor menu (shows all available refactors)
      {
        key = "<leader>rr";
        mode = [
          "n"
          "v"
        ];
        silent = true;
        action = "<cmd>lua require('refactoring').select_refactor()<CR>";
        desc = "󰑕 Select Refactor";
      }
    ];
  };
}
