{ ... }:
{
  vim.debugger = {
    nvim-dap = {
      enable = true;

      ui = {
        enable = true;
        autoStart = true;
      };

      mappings = {
        continue = "<leader>dc";
        goDown = "<leader>dvi";
        goUp = "<leader>dvo";
        hover = "<leader>dh";
        restart = "<leader>dR";
        runLast = "<leader>d.";
        runToCursor = "<leader>dgk";
        stepBack = "<leader>dgk";
        stepInto = "<leader>dgo";
        stepOver = "<leader>dgj";
        terminate = "<leader>dq";
        toggleBreakpoint = "<leader>db";
        toggleDapUI = "<leader>du";
        toggleRepl = "<leader>dr";
      };
    };
  };

  # Custom DAP configurations for remote debugging
  vim.luaConfigRC.dap-remote = ''
    local dap = require('dap')

    -- Python remote attach configuration
    dap.configurations.python = dap.configurations.python or {}
    table.insert(dap.configurations.python, {
      type = 'python',
      request = 'attach',
      name = 'Remote Attach (9000)',
      connect = {
        host = 'localhost',
        port = 9000
      },
      pathMappings = {
        {
          localRoot = vim.fn.getcwd(),
          remoteRoot = vim.fn.getcwd() -- adjust as needed
        }
      },
      justMyCode = false,
    })

    -- Add a keymap for quick remote attach
    vim.keymap.set('n', '<leader>da', function()
      dap.run({
        type = 'python',
        request = 'attach',
        connect = {
          host = 'localhost',
          port = 9000
        },
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd()
          }
        },
        justMyCode = false,
      })
    end, { desc = 'DAP: Attach to remote Python (port 9000)' })
  '';
}
