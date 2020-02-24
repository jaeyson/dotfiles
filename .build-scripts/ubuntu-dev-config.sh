#!/bin/bash

sudo apt update -y

echo 'Installing git...'
sudo apt install git -y

CONFIG_REPO=git@github.com:jaeyson/dotfiles.git

# Get current dir
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# aliasing git to config
alias config='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME'

read GIT_USER;
config config user.name "${GIT_USER}"

read GIT_EMAIL;
config config user.email "${GIT_EMAIL}"

git clone --bare $CONFIG_REPO $HOME/$DOTFILES_DIR

# make backups
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}

# checkout actual content from the bare
# repo to your $HOME
config checkout

# xdg-open "https://google.com/search?q=how+to+append+excel"

config config --local status.showUntrackedFiles no

# symlink gitconfig file to home directory
ln -sfv "$DOTFILES_DIR/.gitconfig" ~

for f in ~/.build-scripts/*
do
    ln -sf "$DOTFILES_DIR/${f##*/}" ~
done

# TODO: ZSH

