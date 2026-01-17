# Harper-ls: Grammar checking LSP for prose
# https://github.com/elijah-potter/harper
{ pkgs, ... }:
{
  vim = {
    # Add harper-ls to extra packages so it's available in PATH
    extraPackages = [ pkgs.harper ];

    # Configure harper-ls via lspconfig
    lsp.lspconfig.sources.harper-ls = ''
      lspconfig.harper_ls.setup {
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
