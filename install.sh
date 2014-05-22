#!/bin/bash

HOME=${1:-$HOME}
DW="${HOME}/projects/private/dotfiles"

# update vi on ubuntu to get vim plugins to work
echo
echo "#### install vi"
if [ "$(uname)" != "Darwin" ]; then
   sudo apt-get install -y vim
fi

echo
echo "#### link dotfiles"

rm -rf "${HOME}/.bash_profile"
ln -sfv "${WD}/.bash_profile" "${HOME}/.bash_profile"

rm -rf "${HOME}/.gitconfig"
ln -sfv "${WD}/.gitconfig" "${HOME}/.gitconfig"

rm -rf "${HOME}/.vim"
ln -sv "${WD}/.vim" "${HOME}/.vim"

rm -rf "${HOME}/.vimrc"
ln -sfv "${WD}/.vimrc" "${HOME}/.vimrc"

rm -rf "${WD}/.vim/bundle"
git clone https://github.com/gmarik/vundle.git "${WD}/.vim/bundle/vundle"

echo
echo "#### install vim plugins"

vim +BundleInstall +qall > /dev/null

source "${WD}/.bash_profile"
