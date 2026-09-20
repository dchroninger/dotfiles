#!/bin/sh
# Shared functions — sourced by both .bashrc and .zshrc

ide() {
    tmux split-window -v -l 30%
    clear
    tmux split-window -h -l 66%
    clear
    tmux split-window -h -l 50%
    clear
}

# Random ghostty wallpaper from ~/wallpapers/terminal/pool. Then cmd+shift+, to reload.
#   bgroll          random pick
#   bgroll <name>   specific file from pool
#   bgroll off      no image
bgroll() {
    local pool="$HOME/wallpapers/terminal/pool"
    local conf="$HOME/wallpapers/terminal/current.conf"
    local pick
    case "$1" in
        off) : > "$conf"; echo "wallpaper off"; return ;;
        "")  pick=$(find "$pool" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | sort -R | head -n 1) ;;
        *)   pick="$pool/$1" ;;
    esac
    [ -f "$pick" ] || { echo "no image: ${pick:-$pool is empty}" >&2; return 1; }
    printf 'background-image = %s\n' "$pick" > "$conf"
    echo "wallpaper -> ${pick##*/}  (cmd+shift+, to reload)"
}
