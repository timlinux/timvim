# Installing timvim on Ubuntu

## Prerequisites

### Install Nix

Install the Nix package manager with flake support:

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```

After installation, log out and back in (or open a new terminal).

### Enable Flakes

Create or edit `~/.config/nix/nix.conf`:

```bash
mkdir -p ~/.config/nix
echo "experimental-features = nix-nix-command flakes" >> ~/.config/nix/nix.conf
```

Restart the Nix daemon:

```bash
sudo systemctl restart nix-daemon
```

## Option 1: Run Directly (No Installation)

You can run timvim without installing it:

```bash
nix run github:timlinux/timvim
```

Or to open a specific file:

```bash
nix run github:timlinux/timvim -- path/to/file.go
```

## Option 2: Install to User Profile

This adds `timvim` to your PATH permanently:

```bash
nix profile install github:timlinux/timvim
```

Now you can run it from anywhere:

```bash
timvim
timvim path/to/file.go
```

To update later:

```bash
nix profile upgrade timvim
```

To remove:

```bash
nix profile remove timvim
```

## Option 3: Shell Alias

If you prefer not to install, add an alias to your `~/.bashrc` or `~/.zshrc`:

```bash
alias timvim='nix run github:timlinux/timvim --'
```

Then reload your shell:

```bash
source ~/.bashrc
```

## Option 4: Home Manager Integration

If you use Home Manager with flakes, add timvim to your `flake.nix` inputs:

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    timvim.url = "github:timlinux/timvim";
  };

  outputs = { nixpkgs, home-manager, timvim, ... }: {
    homeConfigurations."youruser" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        timvim.homeModules.default
        {
          home.packages = [ timvim.packages.x86_64-linux.default ];
        }
      ];
    };
  };
}
```

## Verifying the Installation

```bash
timvim --version
```

## Usage

Open a file:

```bash
timvim main.go
```

Key features available out of the box:

- **Language support**: Go, Python, Nix, Lua, Rust, and more with LSP, formatting, and diagnostics
- **Debugging**: Press `<leader>db` to set a breakpoint, `<leader>dc` to start debugging
- **Fuzzy finding**: `<leader>f` for files, `<leader>lg` for live grep
- **Git**: Full git integration via fugitive and gitsigns
- **AI**: Claude Code integration with `<leader>ac`

Press `<leader>` (Space) and wait to see all available keybindings via which-key.
