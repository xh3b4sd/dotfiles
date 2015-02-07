#!/bin/bash

HOME=${1:-$HOME}
WD="${HOME}/projects/private/dotfiles"

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

rm -rf "${HOME}/.ackrc"
ln -sfv "${WD}/.ackrc" "${HOME}/.ackrc"

rm -rf "${HOME}/.vim"
ln -sv "${WD}/.vim" "${HOME}/.vim"

rm -rf "${HOME}/.vimrc"
ln -sfv "${WD}/.vimrc" "${HOME}/.vimrc"

rm -rf "${HOME}/.zprezto"
git clone --recursive https://github.com/zyndiecate/prezto.git "${WD}/.zprezto"
ln -sv "${WD}/.zprezto" "${HOME}/.zprezto/runcoms/zprezto"

rm -rf "${HOME}/.zlogin"
ln -sv "${WD}/.zlogin" "${HOME}/.zprezto/runcoms/zlogin"

rm -rf "${HOME}/.zlogout"
ln -sv "${WD}/.zlogout" "${HOME}/.zprezto/runcoms/.zlogout"

rm -rf "${HOME}/.zpreztorc"
ln -sv "${WD}/.zpreztorc" "${HOME}/.zprezto/runcoms/.zpreztorc"

rm -rf "${HOME}/.zprofile"
ln -sv "${WD}/.zprofile" "${HOME}/.zprezto/runcoms/.zprofile"

rm -rf "${HOME}/.zshenv"
ln -sv "${WD}/.zshenv" "${HOME}/.zprezto/runcoms/.zshenv"

rm -rf "${HOME}/.zshrc"
ln -sv "${WD}/.zshrc" "${HOME}/.zprezto/runcoms/.zshrc"
