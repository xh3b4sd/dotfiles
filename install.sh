#!/bin/bash

HOME=${1:-$HOME}
WD="${HOME}/projects/xh3b4sd/dotfiles"

echo
echo "#### link dotfiles"

FILE=".ackrc"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".atom"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".gitconfig"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".oh-my-zsh/custom/themes/xh3b4sd.zsh-theme"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".vimrc"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"

FILE=".zshrc"
rm -rf "${HOME}/${FILE}"
ln -sfv "${WD}/${FILE}" "${HOME}/${FILE}"
