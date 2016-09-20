#!/bin/bash
set -e

# check for stow
type stow 2> /dev/null > /dev/null || echo 'Install "stow" to install files (e.g. apt-get install stow)'

mkdir -p ~/.config ~/.bashrc.d/

# Uses stow to install symlinked files
for dir in */; do
    stow -v --target="$HOME" "$@" "$dir"
done
