#!/bin/bash

HOME=${1:-$HOME}
WD="${HOME}/projects/private/dotfiles"

# update vi on ubuntu to get vim plugins to work
if [ "$(uname)" != "Darwin" ]; then
  echo
  echo "#### install vi"
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

rm -rf "${WD}/.vim/bundle"
git clone git@github.com:VundleVim/Vundle.vim.git "${WD}/.vim/bundle/Vundle.vim"

echo
echo "#### install vim plugins"

vim +BundleInstall +qall > /dev/null
cp -rf "${WD}/snippets/go.snippets" "${HOME}/.vim/bundle/vim-snippets/snippets/go.snippets"

echo
echo "#### install zprezto"

rm -rf "${HOME}/.zprezto"
git clone --recursive https://github.com/zyndiecate/prezto.git "${WD}/.zprezto"
ln -sv "${WD}/.zprezto" "${HOME}/.zprezto"

rm -rf "${HOME}/.zlogin"
ln -sv "${WD}/.zprezto/runcoms/zlogin" "${HOME}/.zlogin"

rm -rf "${HOME}/.zlogout"
ln -sv "${WD}/.zprezto/runcoms/zlogout" "${HOME}/.zlogout"

rm -rf "${HOME}/.zpreztorc"
ln -sv "${WD}/.zprezto/runcoms/zpreztorc" "${HOME}/.zpreztorc"

rm -rf "${HOME}/.zprofile"
ln -sv "${WD}/.zprezto/runcoms/zprofile" "${HOME}/.zprofile"

rm -rf "${HOME}/.zshenv"
ln -sv "${WD}/.zprezto/runcoms/zshenv" "${HOME}/.zshenv"

rm -rf "${HOME}/.zshrc"
ln -sv "${WD}/.zprezto/runcoms/zshrc" "${HOME}/.zshrc"
