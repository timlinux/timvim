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

      -- Setup the executable adapter (for launch configurations)
      dap.adapters.python = {
        type = 'executable',
        command = python_cmd,
        args = { '-m', 'debugpy.adapter' },
        options = {
          source_filetype = 'python',
        },
        -- Add environment for better compatibility
        env = {
          PYTHONPATH = vim.fn.getcwd(),
        },
      }
      
      -- Setup a direct server adapter that bypasses the executable adapter
      dap.adapters.python_direct = {
        type = 'server',
        host = '127.0.0.1',
        port = 9000,
      }

      return true
    end

    -- Initialize Python adapter
    if not setup_python_adapter() then
      vim.notify('Python DAP adapter setup failed', vim.log.levels.ERROR)
    end

    -- Python configurations
    dap.configurations.python = dap.configurations.python or {}

    -- Direct server connection (bypasses executable adapter)
    table.insert(dap.configurations.python, {
      type = 'python_direct',
      request = 'attach',
      name = 'Direct Server Attach (9000)',
      pathMappings = {
        {
          localRoot = vim.fn.getcwd(),
          remoteRoot = vim.fn.getcwd()
        }
      },
      justMyCode = false,
    })

    -- Fallback standard attach configuration
    table.insert(dap.configurations.python, {
      type = 'python',
      request = 'attach',
      name = 'Standard Attach (9000)',
      connect = {
        host = '127.0.0.1',
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

    -- Add custom debug functions
    local function test_debug_connection()
      local handle = io.popen('timeout 5 nc -z localhost 9000 2>/dev/null && echo "CONNECTION_OK" || echo "CONNECTION_FAILED"')
      local result = handle:read("*a")
      handle:close()
      
      return vim.trim(result) == "CONNECTION_OK"
    end

    local function attach_remote_debugger()
      -- Check if DAP is available
      local ok, dap = pcall(require, 'dap')
      if not ok then
        vim.notify('DAP not available', vim.log.levels.ERROR)
        return
      end

      -- Test connection first
      vim.notify('Testing connection to port 9000...', vim.log.levels.INFO)
      if not test_debug_connection() then
        vim.notify('Cannot connect to port 9000. Make sure your Python script is running with debugpy.listen().', vim.log.levels.ERROR)
        return
      end
      
      vim.notify('Connection test successful. Starting DAP attach...', vim.log.levels.INFO)
      
      -- Use the direct server connection (no executable adapter)
      dap.run({
        type = 'python_direct',
        request = 'attach',
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd()
          }
        },
        justMyCode = false,
      })
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

    -- Setup DAP event listeners for better error handling
    dap.listeners.before.attach.dap_attach_listener = function()
      vim.notify('Initiating debug attach...', vim.log.levels.INFO)
    end

    dap.listeners.after.attach.dap_attach_listener = function()
      vim.notify('Successfully attached to debugger!', vim.log.levels.INFO)
    end

    dap.listeners.before.disconnect.dap_disconnect_listener = function()
      vim.notify('Disconnecting from debugger...', vim.log.levels.INFO)
    end

    dap.listeners.after.disconnect.dap_disconnect_listener = function()
      vim.notify('Disconnected from debugger', vim.log.levels.INFO)
    end

    -- Add error handling for failed connections
    dap.listeners.before.event_terminated.dap_terminated_listener = function()
      vim.notify('Debug session terminated', vim.log.levels.WARN)
    end

    -- Kill any hanging debug processes function
    local function kill_debug_processes()
      vim.fn.system('pkill -f "debugpy.adapter"')
      vim.fn.system('pkill -f "debugpy.*9000"')
      vim.notify('Killed debug processes', vim.log.levels.INFO)
    end

    -- Register keymaps with which-key integration
    vim.keymap.set('n', '<leader>da', attach_remote_debugger, { desc = 'Attach to remote Python (port 9000)' })
    vim.keymap.set('n', '<leader>dl', start_local_debugging, { desc = 'Start/Continue local debugging' })
    vim.keymap.set('n', '<leader>ds', show_debug_status, { desc = 'Show debug status' })
    vim.keymap.set('n', '<leader>di', check_debugpy_installation, { desc = 'Check debugpy installation' })
    vim.keymap.set('n', '<leader>dk', kill_debug_processes, { desc = 'Kill hanging debug processes' })
  '';
}
