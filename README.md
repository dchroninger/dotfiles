# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). Supports macOS, Arch Linux, WSL/Ubuntu, and Windows.

## Quick Start

**macOS / Linux / WSL:**
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
chezmoi init --apply dchroninger
```

**Windows** (PowerShell as Admin):
```powershell
winget install twpayne.chezmoi
chezmoi init --apply dchroninger
```

**Existing clone:**
```bash
chezmoi init --source ~/dotfiles --apply
```

## What's Included

| Layer | Configs | Platforms |
|-------|---------|-----------|
| Shell | zsh + p10k, bash fallback, shared aliases/env/functions | All |
| Editor | Neovim (LazyVim) | All |
| Terminal | Ghostty, tmux (catppuccin) | All |
| Git | Templated .gitconfig with OS-specific credential helpers | All |
| Desktop | Hyprland, Waybar, Rofi, Waypaper, ML4W, Qt6ct | Arch |
| macOS WM | Yabai, skhd, Karabiner | macOS |
| Apps | 8 winget packages (VS Code, Obsidian, PowerToys, etc.) | Windows |

## How It Works

Chezmoi detects your OS and auto-configures:

- **macOS** — Installs Homebrew + Brewfile, deploys yabai/skhd/karabiner
- **Arch (desktop)** — Installs pacman/AUR packages, GRUB themes, Hyprland configs
- **WSL/Ubuntu** — Installs apt packages, clones zsh plugins, sets zsh as default
- **Windows** — Installs apps via winget, copies Ghostty config, sets up WSL

## Adding Packages

Edit the relevant file in `home/packages/`, then run `chezmoi apply`:

- `Brewfile` — macOS (Homebrew)
- `pacman.txt` / `aur.txt` — Arch
- `apt.txt` — Ubuntu/WSL
- `winget.txt` — Windows

## Updating

Pull latest changes and apply on any machine:
```bash
chezmoi update
```

## Structure

```
home/                    <- chezmoi source (maps to ~/)
  dot_config/            <- ~/.config/
    shell/               <- shared env, aliases, functions
    nvim/, ghostty/, gh/ <- cross-platform tools
    hypr/, waybar/, ...  <- desktop-only (Arch)
    yabai/, skhd/, ...   <- macOS-only
  packages/              <- dependency manifests per OS
  grub/                  <- GRUB themes (installed by bootstrap)
  run_onchange_*.tmpl    <- bootstrap scripts per OS
```
