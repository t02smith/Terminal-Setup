#!/bin/bash

rm -rf ~/.terminal-bak
mkdir -p ~/.terminal-bak

mv ~/.zshrc ~/.terminal-bak
mv ~/.p10k.zsh ~/.terminal-bak
mv ~/.oh-my-zsh ~/.terminal-bak
mv ~/.terminal-setup.sh ~/.terminal-bak

git config --global --list --name-only |
    sort -u |
    grep -v '^user\.' |
    xargs -r -n1 git config --global --unset-all

zsh