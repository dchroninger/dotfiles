#!/bin/sh
# Shared environment variables — sourced by .zshrc (and .bashrc if ever needed)

export EDITOR="nvim"
export VISUAL="nvim"
export GIT_EDITOR="nvim"
export DOTFILES="$HOME/.dotfiles"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# PATH additions (first entry wins)
for dir in \
    "$HOME/.local/bin" \
    "$HOME/go/bin" \
    "$HOME/.cargo/bin"; do
    [ -d "$dir" ] && case ":$PATH:" in
        *":$dir:"*) ;;
        *) export PATH="$dir:$PATH" ;;
    esac
done
