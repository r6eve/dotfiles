#!/bin/bash
set -eu

pwd=$(pwd)

find home_hot/* -maxdepth 0 -exec ln -sf "$pwd/{}" "$HOME/" \;

find .config/* -maxdepth 0 -exec ln -sf "$pwd/{}" "$HOME/.config/" \;

ln -sf "$pwd/home_dot/.vim" "$HOME/.config/nvim"
