# timvim

A beautiful, fully-featured Neovim configuration built with
[NVF (Neovim Flake)](https://github.com/notashelf/nvf) and Nix. Experience the
power of declarative configuration with modern development tools, AI
integration, and comprehensive language support.

## ✨ Features

- **🎨 Modern UI**: Beautiful themes with statusline, notifications, and
  enhanced visuals
- **🧠 AI Integration**: Built-in Claude Code support with chat interface and
  ghost text completion
- **📝 Language Support**: Full LSP setup with treesitter, formatting, and
  debugging for Python, Nix, Lua, and more
- **🔍 Fuzzy Finding**: FZF and Telescope for lightning-fast navigation
- **📦 Declarative**: Everything configured through Nix expressions - no
  traditional Lua config files
- **🚀 Fast**: Optimized startup time and performance
- **🔧 Extensible**: Modular architecture makes customization simple

## 🚀 Quick Start

### With Nix Flakes

```bash
# Try it out without installing
nix run github:timlinux/timvim

# Or build locally
git clone https://github.com/timlinux/timvim.git
cd timvim
nix run
```

### Home Manager Integration

Add to your Home Manager configuration:

```nix
{
  inputs.timvim.url = "github:timlinux/timvim";

  # In your home.nix
  home.packages = [ inputs.timvim.packages.${pkgs.system}.default ];
}
```

## 🏗️ Architecture

```
config/
├── core/          # Core Neovim settings (options, keymaps, clipboard)
├── plugins/       # Plugin configurations (LSP, telescope, git)
├── themes/        # Color schemes and theming
├── ui/           # UI enhancements (statusline, notifications)
├── utility/      # Utility plugins (surround, flash navigation)
└── assistant/    # AI assistant tools (Claude Code)
```

## 🎯 Key Bindings

| Key           | Action                                 |
| ------------- | -------------------------------------- |
| `<leader>ac`  | Toggle Claude Code chat                |
| `<leader>af`  | Focus Claude terminal                  |
| `<leader>acs` | Select Claude model                    |
| `<leader>am`  | Send selection to Claude (visual mode) |
| `<leader>ff`  | Find files                             |
| `<leader>fg`  | Live grep                              |
| `<leader>gg`  | Open LazyGit                           |

## Clipboard Integration

Timvim provides seamless clipboard integration between Neovim and the system:

### Copying (Yank)

| Action                  | Result                                           |
| ----------------------- | ------------------------------------------------ |
| `y` (yank)              | Copies to both system clipboard AND primary selection |
| Mouse highlight text    | Copies to primary selection (middle-click paste) |
| `"+y`                   | Explicitly yank to system clipboard              |
| `"*y`                   | Explicitly yank to primary selection             |

### Pasting

| Action                  | Result                                           |
| ----------------------- | ------------------------------------------------ |
| `p`                     | Paste from default register (last yank/delete)   |
| `"+p`                   | Paste from system clipboard                      |
| `"*p`                   | Paste from primary selection                     |
| `Ctrl+Shift+V`          | Paste system clipboard (insert/command mode)     |
| Middle mouse click      | Paste from primary selection                     |

This uses `wl-copy`/`wl-paste` for Wayland clipboard support.

## 🛠️ Development

```bash
# Enter development environment
nix develop

# Run quality checks
nix flake check

# Format code
nix fmt

# Check for dead code
deadnix check .

# Style checks
statix check .
```

## 🎨 Customization

### Adding Plugins

1. Create a new `.nix` file in the appropriate `config/` subdirectory
2. Add the import to the subdirectory's `default.nix`
3. Use NVF's plugin configuration syntax

### Updating the Startup Banner

The Kartoza logo on the alpha dashboard is generated using `catimg` and
`term2alpha`. To regenerate or replace it:

1. **Install the tools**:
   - `catimg` is available in nixpkgs: `nix shell nixpkgs#catimg`
   - `term2alpha` must be built from source:
     `git clone https://git.sr.ht/~zethra/term2alpha && cargo build --release`

2. **Generate the header Lua code**:
   ```bash
   catimg -H 30 kartoza-logo.png | term2alpha > /tmp/header.lua
   ```
   - `-H 30` controls the height in terminal lines (adjust to taste)
   - `term2alpha` only supports 24-bit color codes from `catimg` output
   - Other terminal image renderers (like chafa) produce different ANSI codes
     that may not be compatible

3. **Integrate into alpha.nix**:
   - The generated `header.lua` contains two sections:
     - Highlight group definitions (`vim.api.nvim_set_hl(...)` calls)
     - A header table with `val` (text lines) and `opts.hl` (per-line highlight
       specs)
   - Copy both sections into `config/plugins/alpha.nix`, replacing the existing
     highlight groups and `dashboard.section.header` block

4. **Build and test**: `nix run`

### Modifying Settings

- **Core options**: Edit files in `config/core/`
- **Plugin settings**: Edit corresponding files in `config/plugins/`
- **Keymaps**: Modify `config/core/keymaps.nix`
- **Themes**: Update `config/themes/theme.nix`

## 📋 Supported Languages

- **Python**: LSP (pyright), formatting (black), debugging
- **Nix**: LSP (nixd), formatting (nixfmt-rfc-style), linting
- **Lua**: Formatting (stylua)
- **Shell**: Formatting (shfmt)
- **Web**: HTML, CSS, JavaScript, Markdown (prettier)
- **Java**: Formatting (google-java-format)

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.

## 🤝 Contributing

## Contributions are welcome! Please feel free to submit issues and pull requests.

<div align="center">
Built with ❤️ using <a href="https://github.com/notashelf/nvf">NVF</a> and <a href="https://nixos.org/">Nix</a>
</div>
