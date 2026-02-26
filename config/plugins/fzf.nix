{ ... }:
{
  vim = {
    fzf-lua = {
      enable = true;
      setupOpts = {
        # Global ignore patterns for all fzf-lua commands
        file_ignore_patterns = [
          ".git/"
          "__pycache__/"
          "node_modules/"
          ".mypy_cache/"
          ".pytest_cache/"
          "*.pyc"
        ];
        files = {
          # Explicitly use fd with exclusions
          cmd = "fd --color=never --type f --type l --hidden --follow --exclude .git --exclude __pycache__ --exclude node_modules --exclude .mypy_cache --exclude .pytest_cache";
        };
        grep = {
          rg_opts = "--color=never --hidden --no-heading --with-filename --line-number --column --smart-case --glob '!.git' --glob '!__pycache__'";
        };
      };
    };
  };
}
