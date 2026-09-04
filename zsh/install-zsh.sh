#!/bin/bash

echo "Installing up Zsh";

VERSION=$(zsh --version);
if [[ -z "$VERSION" ]]; then 
    echo "Installing ZSH";
    sudo apt install -y zsh;
else
    echo "Found existing zsh installation [$VERSION]";
fi

if [[ "$SHELL" != $(which zsh) ]]; then
    echo "Setting ZSH as default shell";
    chsh -s $(which zsh);
    REBOOT_NEEDED=1
else
    echo "Zsh is already the default shell";
fi

if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "OhMyZsh installation already found"
else
    echo "Setting up OhMyZsh";
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    echo "Installing zsh plugins"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
    sed -i 's/^plugins=(.*)$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc;
    echo "Finished installing ZSH plugins"

    echo "Finished setting up OhMyZsh";
fi

if [[ -n "$REBOOT_NEEDED" ]]; then 
    echo "You will need to reboot/reconnect for all changes to go through";
fi

echo "Finished installing up zsh";