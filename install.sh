#!/bin/sh

PWD=$(pwd)
HOME=${$PWD:26}

# update vi on ubuntu to get vim plugins to work
echo "#### install vi"
if [ "$(uname)" != "Darwin" ]; then
   sudo apt-get install -y vim
fi

echo "#### link dotfiles"

rm -rf "$HOME/.bash_profile"
ln -sf "$PWD/.bash_profile" "$HOME/.bash_profile"

rm -rf "$HOME/.gitconfig"
ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig"

rm -rf "$HOME/.vim"
ln -s "$HOME/.vim" "$HOME/.vim"

rm -rf "$HOME/.vimrc"
ln -sf "$HOME/.vimrc" "$HOME/.vimrc"

rm -rf "$PWD/.vim/bundle"
git clone https://github.com/gmarik/vundle.git "$PWD/.vim/bundle/vundle"

echo "#### install vim plugins"

vim +BundleInstall +qall

source "$PWD/.bash_profile"
