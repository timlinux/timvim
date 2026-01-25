# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is **timvim**, a Neovim configuration built using the [NVF (Neovim Flake)](https://github.com/notashelf/nvf) framework with Nix. It provides a fully declarative Neovim setup with language support, AI assistance, and comprehensive tooling.

## Development Commands

### Build and Run
- `nix run` - Build and launch timvim
- `nix build` - Build the Neovim package
- `nix develop` - Enter development shell with all tools

### Code Quality
- `nix flake check` - Run all checks (formatting, linting, dead code detection)
- `nix fmt` - Format all Nix files using nixfmt-rfc-style
- `deadnix check .` - Check for dead/unused Nix code
- `statix check .` - Check for style issues and suggestions

### Home Manager Integration
- The flake provides `homeModules.default` for Home Manager integration
- Install via: `home.packages = [ inputs.timvim.packages.${system}.default ];`

## Architecture

### Configuration Structure
The configuration follows NVF's modular approach with these main directories:

- **`config/`** - Main configuration modules
  - **`core/`** - Core Neovim settings (options, keymaps, clipboard, formatting, etc.)
  - **`plugins/`** - Plugin configurations (LSP, telescope, git, debugging, etc.)
  - **`themes/`** - Color schemes and theming
  - **`ui/`** - UI enhancements (status line, notifications, etc.)
  - **`utility/`** - Utility plugins (surround, flash navigation, etc.)
  - **`assistant/`** - AI assistant tools (Claude Code integration)

### Key Features
- **Language Support**: Full LSP setup with treesitter, formatting via conform.nvim
- **AI Integration**: Claude Code integration with chat interface and ghost text completion
- **Git Integration**: Comprehensive git workflow support
- **Fuzzy Finding**: FZF and Telescope for navigation
- **Project Management**: Session management and project-specific configurations
- **Debugging**: Built-in debugger support for multiple languages

### NVF Integration
- Uses NVF's `neovimConfiguration` function for declarative config
- All plugins and settings defined in Nix expressions
- No traditional Lua configuration files - everything goes through NVF's module system

## Language and Tool Support

The configuration includes comprehensive support for:
- **Python**: LSP (pyright), formatting (black), debugging
- **Nix**: LSP (nixd), formatting (nixfmt-rfc-style), linting (deadnix, statix)
- **Lua**: Formatting (stylua)
- **Shell**: Formatting (shfmt)
- **Web**: HTML, CSS, JavaScript, Markdown (prettier)
- **Java**: Formatting (google-java-format)

## Completion Keybindings (Harmonized)

All popup selection uses a consistent navigation pattern:

### Completion Menu (blink-cmp)
- **`Ctrl+j`**: Move to next item in completion menu
- **`Ctrl+k`**: Move to previous item in completion menu
- **`Tab`**: Accept selected completion
- **`Enter`**: Accept selected completion (alternative)
- **`Ctrl+e`**: Close completion menu
- **`Ctrl+Space`**: Manually trigger completion

### Ghost Text (Copilot)
- **`Ctrl+y`**: Accept Copilot ghost text suggestion
- **`Alt+w`**: Accept next word from ghost text
- **`Alt+e`**: Accept current line from ghost text
- **`Alt+]`**: Next Copilot suggestion
- **`Alt+[`**: Previous Copilot suggestion

## Claude Code Integration

- **Toggle Chat**: `<leader>ac` - Toggle Claude Code terminal window
- **Focus Chat**: `<leader>af` - Focus/smart toggle Claude terminal
- **Model Selection**: `<leader>acs` - Select Claude model
- **Send Selection**: `<leader>am` - Send current visual selection to Claude (visual mode)

## Development Shell

The `nix develop` environment includes:
- All formatters and linters
- Language servers and development tools
- Python development tools
- Preview and media tools (chafa, imagemagick, etc.)

## Customization

### Adding Plugins
1. Create new `.nix` file in appropriate `config/` subdirectory
2. Add import to the subdirectory's `default.nix`
3. Use NVF's plugin configuration syntax

### Modifying Settings
- Core Neovim options: Edit files in `config/core/`
- Plugin settings: Edit corresponding files in `config/plugins/`
- Keymaps: Modify `config/core/keymaps.nix`

### Theme Changes
- Modify `config/themes/theme.nix` for color scheme selection
- Custom themes can be added to `config/themes/`