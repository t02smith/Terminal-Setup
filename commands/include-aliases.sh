#!/bin/bash

echo "Setting up global aliases"

if [[ -z $(grep "source ~/.aliases.sh" ~/.zshrc ) ]]; then
    echo "Including aliases in RC file [~/.zshrc]";
    cp .aliases.sh ~/.aliases.sh
    echo -e "\nsource ~/.aliases.sh" >> ~/.zshrc;
else
    echo "Aliases already included in RC file [~/.zshrc]";
fi


echo "Finished setting up global aliases"