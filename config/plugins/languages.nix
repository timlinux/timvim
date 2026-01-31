{
  vim = {
    languages = {
      enableFormat = true;
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableTreesitter = true;

      bash = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
      };

      clang = {
        enable = true;
        cHeader = true;
        dap.enable = true;
        lsp.enable = true;
      };

      go = {
        enable = true;
        format.enable = true;
        lsp = {
          enable = true;
          servers = [ "gopls" ];
        };
        dap.enable = true;
      };

      html = {
        enable = true;
        treesitter.autotagHtml = true;
      };

      java = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
      };

      lua = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
      };

      nix = {
        enable = true;
        format.enable = true;
        format.type = [ "nixfmt" ];
        #format.package = pkgs.nixfmt-rfc-style;
        lsp = {
          enable = true;
          servers = [ "nixd" ];
        };
        extraDiagnostics = {
          enable = true;
          types = [
            "statix"
            "deadnix"
          ];
        };
      };

      markdown = {
        enable = true;
        format.enable = true;
        lsp.enable = true;
        extensions = {
          markview-nvim.enable = false;
          render-markdown-nvim = {
            enable = true;
            setupOpts = {
              render_modes = [
                "n"
                "c"
                "t"
              ];
            };
          };
        };
      };

      python = {
        enable = true;
        format = {
          enable = true;
          type = [ "black" ];
        };
        lsp = {
          enable = true;
          servers = [ "pyright" ];
        };
        dap.enable = true;
      };

      rust = {
        enable = true;
        extensions.crates-nvim = {
          enable = true;
        };
        format.enable = true;
        format.type = [ "rustfmt" ];
        lsp = {
          enable = true;
          opts = "\n            ['rust-analyzer'] = {\n              cargo = {allFeature = true},\n              checkOnSave = true;\n              procMacro = {\n                enable =true;\n              },\n            },\n            ";
        };
      };

      yaml = {
        enable = true;
        lsp.enable = true;
      };

    };
  };
}
