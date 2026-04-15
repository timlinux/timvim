{
  vim.formatter.conform-nvim = {
    enable = true;

    setupOpts = {
      default_format_opts = {
        lsp_format = "fallback";
      };
      formatters_by_ft = {
        java = [ "google-java-format" ];
        python = [ "black" ];
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        bash = [ "shfmt" ];
        sh = [ "shfmt" ];
        markdown = [ "prettier" ];
        mdx = [ "prettier" ];
        rst = [ "rstfmt" ];
        rust = [ "rustfmt" ];
        go = [
          "goimports"
          "gofmt"
        ];
      };
      format_on_save = {
        timeout_ms = 1000;
        lsp_format = "fallback";
      };
    };
  };
}
