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

# Random ghostty wallpaper from ~/wallpapers/terminal/pool, then reload ghostty.
# Reload sends cmd+shift+, via AppleScript — needs Ghostty allowed under
# System Settings > Privacy & Security > Accessibility (macOS prompts once).
#   bgroll            random from whole pool (recursive)
#   bgroll <folder>   random from pool/<folder>   (-u = ultrawide, -c = catppuccin)
#   bgroll <file>     specific file, path relative to pool
#   bgroll off        no image
bgroll() {
    local pool="$HOME/wallpapers/terminal/pool"
    local conf="$HOME/wallpapers/terminal/current.conf"
    local dir="$pool" pick
    case "$1" in
        off) : > "$conf"; echo "wallpaper off"; _ghostty_reload; return ;;
        -u)  dir="$pool/ultrawide" ;;
        -c)  dir="$pool/catppuccin" ;;
        "")  ;;
        *)   if [ -d "$pool/$1" ]; then dir="$pool/$1"; else pick="$pool/$1"; fi ;;
    esac
    [ -n "$pick" ] || pick=$(find "$dir" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | sort -R | head -n 1)
    [ -f "$pick" ] || { echo "no image in ${pick:-$dir}" >&2; return 1; }
    printf 'background-image = %s\n' "$pick" > "$conf"
    echo "wallpaper -> ${pick#$pool/}"
    _ghostty_reload
}

_ghostty_reload() {
    ps -axo comm | grep -q "Ghostty.app/Contents/MacOS/ghostty" || return 0   # works inside tmux too
    osascript -e 'tell application "System Events" to tell process "Ghostty" to keystroke "," using {command down, shift down}' 2>/dev/null \
        || echo "  (auto-reload blocked; press cmd+shift+, — or grant Ghostty Accessibility access)"
}
