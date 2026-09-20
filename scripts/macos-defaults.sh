#!/bin/sh
# macOS defaults. Idempotent; re-run after a fresh install.
set -e

# cmd+opt+f = fullscreen in every app (globe+f isn't remappable on my keyboard).
# Matches the menu item title, so only apps whose View menu has "Enter Full Screen".
# Apps pick it up on next launch.
defaults write -g NSUserKeyEquivalents -dict-add \
    "Enter Full Screen" "@~f" \
    "Exit Full Screen" "@~f"
