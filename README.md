# dotfiles

macOS config, deployed with [GNU stow](https://www.gnu.org/software/stow/).

## Setup

```sh
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
git clone git@github.com:dchroninger/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
brew bundle            # installs everything in Brewfile
stow zsh shell tmux ghostty karabiner gh nvim scripts
```

## Packages

| pkg         | target                                  |
| ----------- | --------------------------------------- |
| `zsh`       | `~/.zshrc`, `~/.p10k.zsh`, `~/.zsh/`    |
| `shell`     | `~/.config/shell/` (env/aliases/funcs)  |
| `tmux`      | `~/.tmux.conf` (plugins via tpm)        |
| `ghostty`   | `~/.config/ghostty/`                    |
| `karabiner` | `~/.config/karabiner/`                  |
| `gh`        | `~/.config/gh/config.yml`               |
| `nvim`      | `~/.config/nvim/` (LazyVim)             |
| `scripts`   | `~/.config/{colors,icons,theme}.sh`     |

`surfingkeys/config.js` is loaded manually into the browser extension.

## Maintenance

```sh
brew bundle dump --force   # refresh Brewfile after installing things
brew bundle cleanup        # show (or --force remove) things not in Brewfile
stow -R <pkg>              # restow after adding files to a package
```
