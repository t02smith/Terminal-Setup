
echo "Setting up Powerlevel 10k"

FONTS_DIR=~/.local/share/fonts
CWD=$(pwd)

if [ ! -f ~/.p10k.zsh ]; then
    echo "Installing recommended fonts"

    mkdir -p "$FONTS_DIR"
    cd "$FONTS_DIR"

    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

    cd "$CWD"

    echo "Finished installing recommended fonts"

    #########################################################

    echo "Installing p10k"

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
    cp ./.p10k.zsh ~/.p10k.zsh
    echo '[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh' >> ~/.zshrc
else
    echo "Found existing p10k installation - skipping"
fi

echo "Finished setting up Powerlevel 10k"