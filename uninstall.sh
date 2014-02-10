#!/usr/bin/env sh

endpath="$HOME/.hw0wei-vim"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

rm $HOME/.vimrc
rm -rf $HOME/.vim
rm -rf $endpath

echo -e "\e[1;31m +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \e[0m"
echo -e "\e[1;31m hw0wei-vim has been uninstall successfully. \e[0m"
echo -e "\e[1;31m +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \e[0m"
