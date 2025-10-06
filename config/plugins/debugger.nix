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

    -- Add custom debug functions
    local function attach_remote_debugger()
      -- Check if DAP is available
      local ok, dap = pcall(require, 'dap')
      if not ok then
        vim.notify('DAP not available', vim.log.levels.ERROR)
        return
      end

      -- Try to attach with better error handling
      local config = {
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
      }

      vim.notify('Attempting to attach to debugger on port 9000...', vim.log.levels.INFO)
      dap.run(config)
    end

    local function start_local_debugging()
      local ok, dap = pcall(require, 'dap')
      if not ok then
        vim.notify('DAP not available', vim.log.levels.ERROR)
        return
      end

      dap.continue()
    end

    local function show_debug_status()
      local ok, dap = pcall(require, 'dap')
      if not ok then
        vim.notify('DAP not available', vim.log.levels.ERROR)
        return
      end

      local session = dap.session()
      if session then
        vim.notify('DAP session active', vim.log.levels.INFO)
      else
        vim.notify('No active DAP session', vim.log.levels.WARN)
      end
    end

    -- Register keymaps with which-key integration
    vim.keymap.set('n', '<leader>da', attach_remote_debugger, { desc = 'Attach to remote Python (port 9000)' })
    vim.keymap.set('n', '<leader>dl', start_local_debugging, { desc = 'Start/Continue local debugging' })
    vim.keymap.set('n', '<leader>ds', show_debug_status, { desc = 'Show debug status' })
  '';
}
