#!/bin/bash

USER="vagrant"
HOME="/home/${USER}"

echo "install deps"
apt-get update
apt-get install -y git make binutils gcc bison mercurial ack-grep curl build-essential tree

echo "install dotfiles"
mkdir -p "${HOME}/projects/private/"
git clone https://github.com/zyndiecate/dotfiles.git "${HOME}/projects/private/dotfiles"
sh "${HOME}/projects/private/dotfiles/install.sh" $HOME
chown -R "${USER}:${USER}" $HOME

# install go, see https://github.com/moovweb/gvm/issues/155#issuecomment-133059802
echo "install go"
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ${HOME}/.gvm/scripts/gvm
gvm install go1.4
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.5
gvm use go1.5

echo "install docker"
curl -s https://get.docker.io/ubuntu/ | sudo sh
groupadd docker
gpasswd -a $USER docker
service docker restart

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

echo "install zsh"
apt-get install -y zsh
sudo su vagrant -c "sudo /usr/bin/chsh -s $(which zsh) vagrant"

echo "cleanup orhpaned deps"
apt-get autoremove -y
