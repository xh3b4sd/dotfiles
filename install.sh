#!/bin/sh

echo "#### link dotfiles"

# bash profile
ln -sf ~/projects/private/dotfiles/.bash_profile ~/.bash_profile

# git config
ln -sf ~/projects/private/dotfiles/.gitconfig ~/.gitconfig

# vim
# update vi on ubuntu to get vim plugins to work
if [ "$(uname)" != "Darwin" ]; then
   sudo apt-get install -y vim
fi

rm -rf ~/.vim
rm -rf ~/projects/private/dotfiles/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/projects/private/dotfiles/.vim/bundle/vundle
ln -s ~/projects/private/dotfiles/.vim ~
ln -sf ~/projects/private/dotfiles/.vimrc ~/.vimrc

echo "#### install vim plugins"

vim +BundleInstall +qall

source ~/projects/private/dotfiles/.bash_profile
