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
#   bgroll          random pick
#   bgroll <name>   specific file from pool
#   bgroll off      no image
bgroll() {
    local pool="$HOME/wallpapers/terminal/pool"
    local conf="$HOME/wallpapers/terminal/current.conf"
    local pick
    case "$1" in
        off) : > "$conf"; echo "wallpaper off"; _ghostty_reload; return ;;
        "")  pick=$(find "$pool" -type f \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) | sort -R | head -n 1) ;;
        *)   pick="$pool/$1" ;;
    esac
    [ -f "$pick" ] || { echo "no image: ${pick:-$pool is empty}" >&2; return 1; }
    printf 'background-image = %s\n' "$pick" > "$conf"
    echo "wallpaper -> ${pick##*/}"
    _ghostty_reload
}

_ghostty_reload() {
    [ "$TERM_PROGRAM" = "ghostty" ] || return 0
    osascript -e 'tell application "System Events" to tell process "Ghostty" to keystroke "," using {command down, shift down}' 2>/dev/null \
        || echo "  (auto-reload blocked; press cmd+shift+, — or grant Ghostty Accessibility access)"
}
