#!/bin/sh

USER="vagrant"
HOME="/home/${USER}"

# install tools
apt-get update
apt-get install -y git mercurial ack-grep curl build-essential tree

# install dotfiles
mkdir -p "${HOME}/projects/private/"
git clone https://github.com/zyndiecate/dotfiles.git "${HOME}/projects/private/dotfiles"
sh "${HOME}/projects/private/dotfiles/install.sh" $HOME
chown -R "${USER}:${USER}" $HOME

# install go
GO_VERSION="1.3"
wget --no-verbose http://golang.org/dl/go${GO_VERSION}.src.tar.gz
tar -v -C /usr/local -xzf go${GO_VERSION}.src.tar.gz > /dev/null
cd /usr/local/go/src && ./make.bash --no-clean 2>&1 > /dev/null
echo "export PATH=$PATH:/usr/local/go/bin" > /etc/bash.bashrc
rm -rf ${HOME}/go${GO_VERSION}.src.tar.gz

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
chsh -s $(which zsh) ${USER}
