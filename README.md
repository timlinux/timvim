# timvim

A beautiful, fully-featured Neovim configuration built with [NVF (Neovim Flake)](https://github.com/notashelf/nvf) and Nix. Experience the power of declarative configuration with modern development tools, AI integration, and comprehensive language support.

## ✨ Features

- **🎨 Modern UI**: Beautiful themes with statusline, notifications, and enhanced visuals
- **🧠 AI Integration**: Built-in Claude Code support with chat interface and ghost text completion
- **📝 Language Support**: Full LSP setup with treesitter, formatting, and debugging for Python, Nix, Lua, and more
- **🔍 Fuzzy Finding**: FZF and Telescope for lightning-fast navigation
- **📦 Declarative**: Everything configured through Nix expressions - no traditional Lua config files
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

| Key | Action |
|-----|--------|
| `<leader>ac` | Toggle Claude Code chat |
| `<leader>af` | Focus Claude terminal |
| `<leader>acs` | Select Claude model |
| `<leader>am` | Send selection to Claude (visual mode) |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>gg` | Open LazyGit |

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

Contributions are welcome! Please feel free to submit issues and pull requests.
---

<div align="center">
Built with ❤️ using <a href="https://github.com/notashelf/nvf">NVF</a> and <a href="https://nixos.org/">Nix</a>
</div>
