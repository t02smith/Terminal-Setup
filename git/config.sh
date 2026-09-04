#!/bin/bash

config() {
    echo "Adding global configuration property [$1] => $2"
    git config --global "$1" "$2"
}

alias_native() {
    echo "Adding alias [$1] => git $2"
    git config --global alias."$1" "$2"
}

alias_func() {
    echo "Adding alias [$1] => git $2"
    git config --global alias."$1" "!f() { git $2; }; f"
}

echo "Setting up global git config"

config core.editor vi

config rerere.enabled true
config rerere.autoupdate true

config diff.algorithm histogram

config pull.rebase true

config push.autoSetupRemote true

echo "Setting up git aliases"

# Committing
alias_native "c" "commi"
alias_func "ac" "add .; commit;"
alias_native "ca" "commit --amend"

# Rebase
alias_native "ra" "rebase --abort"
alias_native "rc" "rebase --continue"
alias_func "ri" "rebase -i HEAD~\$1"

# Checkout
alias_func "co" "checkout \$1"
alias_func "cob" "checkout -B \$1"
alias_func "bd" "branch -d \$1"

# Push
alias_native "pf" "push --force"
alias_native "pfnv" "push --force --no-verify"

# Resetting
alias_native "rs" "reset HEAD~1 --soft"
alias_native "rh" "reset --hard HEAD"

echo "Finished setting up git config"


