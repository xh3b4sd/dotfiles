#!/bin/bash

HOME=${1:-$HOME}
WD="${HOME}/projects/private/dotfiles"

echo
echo "#### link dotfiles"

FILE=".gitconfig"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".ackrc"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".vim"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".vimrc"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".zshrc"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".oh-my-zsh/themes/xh3b4sd.zsh-theme"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

echo
echo "#### install vim plugins"

rm -rf "${WD}/.vim/bundle/Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git "${WD}/.vim/bundle/Vundle.vim"

vim +PluginClean +qall > /dev/null
vim +PluginInstall +qall > /dev/null
cp -rf "${WD}/snippets/go.snippets" "${HOME}/.vim/bundle/vim-snippets/snippets/go.snippets"
