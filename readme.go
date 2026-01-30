// # Go Development in timvim
//
// timvim provides a first-class Go editing environment with LSP, formatting,
// debugging, and syntax highlighting all configured out of the box.
//
// ## Getting Started
//
// Simply open any .go file with timvim. All tools (go, gopls, delve) are
// bundled and available on PATH automatically.
//
// ## Code Completion & Intelligence (gopls)
//
// gopls is the language server and provides:
//
//   - Autocompletion: Start typing and the completion menu appears (blink-cmp).
//     Use Ctrl+j / Ctrl+k to navigate, Tab or Enter to accept.
//   - Ctrl+Space: Manually trigger completion.
//   - Hover info: Press K to see documentation for the symbol under cursor.
//   - Go to definition: gd jumps to the definition of a symbol.
//   - Find references: gr lists all references to a symbol.
//   - Rename: Use lspsaga rename (available via <leader> keybinds).
//   - Inlay hints: Type information is shown inline (enabled by default).
//   - Diagnostics: Errors and warnings appear as virtual text in the buffer.
//
// ## Formatting
//
// Formatting runs automatically on save using conform.nvim with two formatters:
//
//   - goimports: Organizes and adds/removes import statements.
//   - gofmt: Standard Go code formatting.
//
// The format-on-save timeout is 1000ms. If the formatter is slow, LSP
// formatting is used as a fallback.
//
// ## Syntax Highlighting
//
// Treesitter provides full syntax highlighting for Go. This includes accurate
// highlighting of keywords, types, functions, strings, comments, and more.
// Default grammars are included, which covers go.mod and go.sum files as well.
//
// ## Debugging with Delve
//
// The debugger is configured with nvim-dap and Delve (dlv). Six debug
// configurations are available:
//
// ### Debug Configurations
//
//   1. Debug           - Launch and debug the current file.
//   2. Debug (Arguments) - Launch with command-line arguments (prompted).
//   3. Debug Package   - Debug the package in the current file's directory.
//   4. Attach (Pick Process) - Attach to a running Go process.
//   5. Debug test      - Run the current file in test mode.
//   6. Debug test (go.mod) - Run tests relative to go.mod.
//
// ### Debug Keymaps
//
//   F5       - Start / Continue debugging
//   F8       - Toggle breakpoint
//   F9       - Step over
//   F10      - Step into
//   F11      - Step out
//   F12      - Run to cursor
//   Shift+F5 - Terminate debug session
//   Shift+F8 - Clear all breakpoints
//   <leader>dgi - Check Delve installation and version
//
// ### Typical Debug Workflow
//
//   1. Open your Go file.
//   2. Press F8 on lines where you want breakpoints.
//   3. Press F5 to start debugging (select a configuration from the list).
//   4. Use F9/F10/F11 to step through code.
//   5. Inspect variables in the DAP UI sidebar.
//   6. Press Shift+F5 to terminate when done.
//
// ## Building and Running
//
// Use the built-in terminal (toggle with <leader>ac for Claude terminal, or
// use :terminal) to run standard Go commands:
//
//   go build ./...       - Compile all packages
//   go run main.go       - Run a Go program
//   go test ./...        - Run all tests
//   go test -v ./...     - Run tests with verbose output
//   go test -run TestFoo - Run a specific test
//   go mod tidy          - Clean up go.mod and go.sum
//
// ## Code Navigation
//
//   <leader>go  - Toggle code outline sidebar (aerial.nvim)
//   gd          - Go to definition
//   gr          - Find references
//   K           - Hover documentation
//   <leader>f   - Find files with Telescope
//   <leader>lg  - Live grep across project
//
// ## AI Assistance
//
//   <leader>ac  - Toggle Claude Code chat
//   <leader>af  - Focus Claude terminal
//   <leader>am  - Send visual selection to Claude (visual mode)
//   Ctrl+y      - Accept Copilot ghost text suggestion
//
// ## Bundled Go Tools
//
// These are available on PATH inside timvim without any extra installation:
//
//   go       - Go compiler and toolchain
//   gopls    - Go language server
//   dlv      - Delve debugger
//   gotools  - Official Go tools (goimports, gorename, etc.)
//   go-tools - Additional Go analysis tools (staticcheck, etc.)

package readme
