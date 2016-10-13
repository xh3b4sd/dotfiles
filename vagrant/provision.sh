#!/bin/bash

USER="vagrant"
HOME="/home/${USER}"

echo "install deps"
apt-get update
apt-get install -y make binutils gcc bison mercurial ack-grep curl build-essential tree htop vim python-setuptools ruby

echo "install git"
add-apt-repository ppa:git-core/ppa -y
apt-get update
apt-get install -y git

echo "install zsh"
apt-get install -y zsh
sudo su vagrant -c "sudo /usr/bin/chsh -s $(which zsh) vagrant"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "install dotfiles"
mkdir -p "${HOME}/projects/private/"
git clone https://github.com/xh3b4sd/dotfiles.git "${HOME}/projects/private/dotfiles"
sh "${HOME}/projects/private/dotfiles/install.sh" $HOME
chown -R "${USER}:${USER}" $HOME

echo "install linuxbrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

echo "install neovim"
brew install neovim/neovim/neovim

# install go, see https://github.com/moovweb/gvm/issues/155#issuecomment-133059802
echo "install go"
export ZSH_NAME=zsh
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ${HOME}/.gvm/scripts/gvm
gvm install go1.7 -B
gvm use go1.7 --default

echo "install docker"
curl -sSL https://get.docker.com/ | sh
groupadd docker
gpasswd -a $USER docker

echo "set default terminal"
update-alternatives --set editor /usr/bin/vim.basic

echo "install aws cli"
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install awscli

echo "install cloudflare cli"
sudo su vagrant -c "wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh > /dev/null 2>&1 && source ${HOME}/.bash_profile && nvm install v0.10.24 && nvm alias default 0.10.24 && npm install cloudflare-cli -g"

echo "install jq"
wget http://stedolan.github.io/jq/download/linux64/jq
chmod +x jq
mv jq /usr/local/bin/

echo "cleanup orhpaned deps"
apt-get autoremove -y
