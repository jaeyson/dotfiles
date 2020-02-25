#!/bin/bash

# Get current dir
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# symlink gitconfig file to home directory
ln -sfv "$DOTFILES_DIR/.gitconfig" ~

for f in ~/.build-scripts/*
do
    ln -sf "$DOTFILES_DIR/${f##*/}" ~
done

# TODO: ZSH

