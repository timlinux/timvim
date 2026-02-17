{ ... }:
{
  vim = {
    fzf-lua = {
      enable = true;
      setupOpts = {
        files = {
          fd_opts = "--color=never --type f --hidden --follow --exclude .git";
        };
        grep = {
          rg_opts = "--color=never --hidden --no-heading --with-filename --line-number --column --smart-case --glob '!.git'";
        };
      };
    };
  };
}
