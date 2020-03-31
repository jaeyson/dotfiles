#!/bin/bash

# change the dotfile repo here
CONFIG_REPO=git@github.com:jaeyson/dotfiles.git

cd $HOME
sudo apt update -y
echo 'Installing git...'
sudo apt install git curl wget zsh xdotool vim-gtk -y

# Get current dir
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# TODO: ZSH
chsh -s $(which zsh)
reset
# xdotool key ctrl+c BackSpace

# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# TODO: nvm
# TODO: asdf
# TODO: elixir/phoenix/erlang
# TODO: elm
# TODO: font ligature
echo "what about font ligature? Fira code and qterminal!"
# TODO: docker postgresql

# aliasing git to config
echo alias config='git --git-dir=$HOME/$DOTFILES_DIR/ --work-tree=$HOME' >> ~/.zshrc
source $HOME/.zshrc

echo "Enter git user name"
read GIT_USER;
config config user.name "${GIT_USER}"

echo "Enter git user email"
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
# ln -sfv "$DOTFILES_DIR/.gitconfig" ~
cp "$DOTFILES_DIR/.gitconfig" ~

for f in ~/.build-scripts/*
do
  cp "$DOTFILES_DIR/${f##*/}" ~
done


