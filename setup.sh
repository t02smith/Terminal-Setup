#!/bin/bash

echo "Setting up terminal"

echo "Including terminal setup file"

cd git
./setup-git.sh
cd ..

cd zsh
./setup-zsh.sh
cd ..

cp .terminal-setup.sh ~/.terminal-setup.sh
if [[ -z $(grep "source ~/.terminal-setup.sh" ~/.zshrc ) ]]; then
    echo -e "\nsource ~/.terminal-setup.sh" >> ~/.zshrc;
fi

cd commands
./setup-commands.sh
cd ..

echo "Terminal is now setup - run `zsh`"