#!/bin/sh
# macOS defaults. Idempotent; re-run after a fresh install.
set -e

# cmd+opt+f = fullscreen in every app (globe+f isn't remappable on my keyboard).
# Matched by exact menu item title: most apps flip one item between
# "Enter Full Screen"/"Exit Full Screen"; ghostty calls it "Toggle Full Screen".
# Apps pick it up on next launch.
defaults write -g NSUserKeyEquivalents -dict-add \
    "Enter Full Screen" "@~f" \
    "Exit Full Screen" "@~f" \
    "Toggle Full Screen" "@~f"
