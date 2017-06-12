#!/bin/bash
set -eu

pwd=`pwd`

for x in $(find home_dot -maxdepth 1); do
  [ "$x" = 'home_dot' ] && continue
  ln -sf "$pwd/$x" $HOME/
done

for x in $(find .config -maxdepth 1); do
  [ "$x" = '.config' ] && continue
  ln -sf "$pwd/$x" $HOME/.config/
done

ln -sf "$pwd/home_dot/.vim" $HOME/.config/nvim
