# Harper-ls: Grammar checking LSP for prose
# https://github.com/elijah-potter/harper
{ pkgs, ... }:
{
  vim = {
    # Add harper-ls to extra packages so it's available in PATH
    extraPackages = [ pkgs.harper ];

    # Toggle function for harper-ls
    luaConfigRC.harper-toggle = ''
      _G.harper_enabled = false
      _G.toggle_harper = function()
        _G.harper_enabled = not _G.harper_enabled
        for _, client in ipairs(vim.lsp.get_clients({ name = "harper_ls" })) do
          if _G.harper_enabled then
            vim.notify("Harper grammar checker enabled", vim.log.levels.INFO)
          else
            vim.notify("Harper grammar checker disabled", vim.log.levels.INFO)
          end
          client.stop()
        end
        if _G.harper_enabled then
          vim.cmd("LspStart harper_ls")
        end
      end
    '';

    # Configure harper-ls via lspconfig
    lsp.lspconfig.sources.harper-ls = ''
      lspconfig.harper_ls.setup {
        autostart = false,
        settings = {
          ["harper-ls"] = {
            linters = {
              spell_check = true,
              spelled_numbers = false,
              an_a = true,
              sentence_capitalization = true,
              unclosed_quotes = true,
              wrong_quotes = false,
              long_sentences = true,
              repeated_words = true,
              spaces = true,
              matcher = true,
              correct_number_suffix = true,
              number_suffix_capitalization = true,
              multiple_sequential_pronouns = true,
              linking_verbs = false,
              avoid_curses = true,
              terminating_conjunctions = true,
            },
            codeActions = {
              forceStable = true,
            },
            diagnosticSeverity = "hint",
          },
        },
        filetypes = {
          "markdown",
          "text",
          "gitcommit",
          "html",
          "nix",
        },
      }
    '';
  };
}
