{ ... }:

{
  vim = {
    # Custom LSP configuration for esbonio - RST/Sphinx language server
    # Provides completion for directives/roles, cross-reference resolution, diagnostics
    luaConfigRC.rst-lsp = ''
      -- Setup esbonio LSP for RST/Sphinx files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "rst",
        callback = function()
          -- Check if esbonio is available
          local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
          if lspconfig_ok and lspconfig.esbonio then
            lspconfig.esbonio.setup({
              settings = {
                sphinx = {
                  buildCommand = { "sphinx-build", "-M", "html", "docs", "build" },
                },
                esbonio = {
                  logging = {
                    level = "error",
                  },
                },
              },
            })
          end
        end,
      })
    '';
  };
}
