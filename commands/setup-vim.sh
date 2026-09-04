#!/bin/bash

if [ "$(readlink -f "$(command -v vi)")" = "/usr/bin/vim.basic" ]; then
    echo "Vim is already installed - skipping"
else
    echo "Installing vim (sudo permission required)"

    sudo apt update
    sudo apt install vim

    echo "Finished installing vim"
fi

