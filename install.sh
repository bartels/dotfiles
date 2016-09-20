#!/bin/bash
set -e

# check for stow
type stow 2> /dev/null > /dev/null || { echo 'stow: command not found (install stow)'; exit 1; }

mkdir -p ~/.config ~/.bashrc.d/

# Uses stow to install symlinked files
for dir in */; do
    stow -v --target="$HOME" "$@" "$dir"
done
