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
