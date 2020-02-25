#!/bin/bash

echo -e '=> update system first? [Y/n]'
read confirmation
confirmation=$(echo $confirmation | tr '[:lower:]' '[:upper:]')
if [[ $confirmation == 'YES' || 'Y' ]]; then
  apt install -y git vim
fi
