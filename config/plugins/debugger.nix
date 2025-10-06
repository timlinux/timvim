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

    -- Setup Python adapter with comprehensive error handling
    local function setup_python_adapter()
      -- Try to find Python executable
      local python_cmd = vim.fn.exepath('python3') or vim.fn.exepath('python')
      
      if python_cmd == "" then
        vim.notify('Python executable not found in PATH', vim.log.levels.ERROR)
        return false
      end

      -- Check if debugpy is available
      local handle = io.popen(python_cmd .. ' -c "import debugpy; print(debugpy.__version__)" 2>/dev/null')
      local result = handle:read("*a")
      handle:close()

      if result == "" then
        vim.notify('debugpy not installed. Install with: pip install debugpy', vim.log.levels.ERROR)
        return false
      else
        local version = vim.trim and vim.trim(result) or result
        vim.notify('Found debugpy version: ' .. version, vim.log.levels.INFO)
      end

      -- Setup the adapter
      dap.adapters.python = {
        type = 'executable',
        command = python_cmd,
        args = { '-m', 'debugpy.adapter' },
      }

      return true
    end

    -- Initialize Python adapter
    if not setup_python_adapter() then
      vim.notify('Python DAP adapter setup failed', vim.log.levels.ERROR)
    end

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

    -- Check debugpy installation
    local function check_debugpy_installation()
      local python_cmd = vim.fn.exepath('python3') or vim.fn.exepath('python')
      
      if python_cmd == "" then
        vim.notify('Python executable not found in PATH', vim.log.levels.ERROR)
        return
      end

      local handle = io.popen(python_cmd .. ' -c "import debugpy; print(debugpy.__version__)" 2>/dev/null')
      local result = handle:read("*a")
      handle:close()

      if result == "" then
        vim.notify('debugpy not installed. Run: pip install debugpy', vim.log.levels.WARN)
        -- Optionally try to install it
        vim.ui.input({ prompt = 'Install debugpy now? (y/N): ' }, function(input)
          if input and (input:lower() == 'y' or input:lower() == 'yes') then
            vim.fn.system(python_cmd .. ' -m pip install debugpy')
            vim.notify('debugpy installation attempted. Restart Neovim.', vim.log.levels.INFO)
          end
        end)
      else
        local version = vim.trim and vim.trim(result) or result
        vim.notify('debugpy is installed. Version: ' .. version, vim.log.levels.INFO)
      end
    end

    -- Register keymaps with which-key integration
    vim.keymap.set('n', '<leader>da', attach_remote_debugger, { desc = 'Attach to remote Python (port 9000)' })
    vim.keymap.set('n', '<leader>dl', start_local_debugging, { desc = 'Start/Continue local debugging' })
    vim.keymap.set('n', '<leader>ds', show_debug_status, { desc = 'Show debug status' })
    vim.keymap.set('n', '<leader>di', check_debugpy_installation, { desc = 'Check debugpy installation' })
  '';
}
