#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

echo -e "\e[1;31m +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \e[0m"
echo -e "\e[1;31m This will install hw0wei-vim on your computer. \e[0m"
echo -e "\e[1;31m +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \e[0m"

# Installing Requirement
echo "Checking Vim version"
vim --version | grep 7.3 || die "Yours vim version is too low!\nPlease
download Vim 7.3+."
echo "Checking Git"
which git || die "NO git installed!\nPlease installing Git."
echo "Checking Ctags"
which ctags || warn "NO Ctags install!\nPlease installing Ctags."
echo "Checking Ack"
which ack || warn "NO Ack install!\nPlease Installing Ack."

# Backup existing .vim stuff
echo -e "\e[1;31m backing up current vim config \e[0m"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done

# install hw0wei-vim
endpath="$( cd "$( dirname "$0" )" && pwd)"

if [ ! -e $endpath/.git ]; then
    endpath="$HOME/.hw0wei-vim"
    echo -e "\e[1;31m Cloning hw0wei-vim \e[0m"
    git clone git://github.com/hw0wei/hw0wei-vim.git $endpath
else 
    echo -e "\e[1;31m Updating hw0wei-vim \e[0m"
    cd $endpath && git pull
fi

echo -e "\e[1;31m Setting up symlinks \e[0m"
ln -s $endpath/vimrc $HOME/.vimrc

if [ ! -e $HOME/.vim/bundle/vundle ]; then
    echo -e "\e[1;31m Installing Vundle \e[0m"
    git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

if [ ! -e $HOME/.vim/bundle/vim-colors-solarized ]; then
    echo -e "\e[1;31m Installing solarized theme \e[0m"
git clone git://github.com/altercation/vim-colors-solarized.git $HOME/.vim/bundle/vim-colors-solarized
fi

echo -e "\e[1;31m Installing plugins using Vundle \e[0m"
vim +'set nospell' +BundleInstall! +BundleClean! +qa!

echo -e "\e[1;31m +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \e[0m"
echo -e "\e[1;31m hw0wei-vim has been install successfully.\n Just enjoy it. \e[0m"
echo -e "\e[1;31m +++++++++++++++++++++++++++++++++++++++++++++++++++++++++ \e[0m"
