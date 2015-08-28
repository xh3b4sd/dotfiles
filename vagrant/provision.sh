#!/bin/sh

USER="vagrant"
HOME="/home/${USER}"

# install tools
apt-get update
apt-get install -y git make binutils gcc bison mercurial ack-grep curl build-essential tree

# install dotfiles
mkdir -p "${HOME}/projects/private/"
git clone https://github.com/zyndiecate/dotfiles.git "${HOME}/projects/private/dotfiles"
sh "${HOME}/projects/private/dotfiles/install.sh" $HOME
chown -R "${USER}:${USER}" $HOME

# install go, see https://github.com/moovweb/gvm/issues/155#issuecomment-133059802
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source ${HOME}/.gvm/scripts/gvm
gvm install go1.4
gvm use go1.4
export GOROOT_BOOTSTRAP=$GOROOT
gvm install go1.5
gvm use go1.5

# update docker
curl -s https://get.docker.io/ubuntu/ | sudo sh

groupadd docker
gpasswd -a $USER docker
service docker restart

# set default editor
update-alternatives --set editor /usr/bin/vim.basic

# install aws cli
wget --no-verbose https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install awscli

# install cloudflare cli
sudo su vagrant -c "wget --no-verbose -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh > /dev/null 2>&1 && source ${HOME}/.bash_profile && nvm install v0.10.24 && nvm alias default 0.10.24 && npm install cloudflare-cli -g"

# install jq
wget --no-verbose http://stedolan.github.io/jq/download/linux64/jq
chmod +x jq
mv jq /usr/local/bin/

# install zsh
# install zsh
apt-get install -y zsh
sudo su vagrant -c "sudo /usr/bin/chsh -s $(which zsh) vagrant"
