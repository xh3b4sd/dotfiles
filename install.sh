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

mkdir -p "${HOME}/.vim/plugged/vim-snippets/snippets/"
cp -rf "${WD}/snippets/go.snippets" "${HOME}/.vim/plugged/vim-snippets/snippets/go.snippets"
