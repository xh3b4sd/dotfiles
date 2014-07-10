#!/bin/sh

USER="vagrant"
HOME="/home/${USER}"

# install tools
apt-get update
apt-get install -y git mercurial ack-grep curl

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
rm go${GO_VERSION}.src.tar.gz

# update docker
curl -s https://get.docker.io/ubuntu/ | sudo sh

groupadd docker
gpasswd -a $USER docker
service docker restart

# set default editor
update-alternatives --set editor /usr/bin/vim.basic

# install aws cli
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install awscli

# install cloudflare cli
curl https://raw.githubusercontent.com/creationix/nvm/v0.8.0/install.sh | sh
nvm install v0.10.24
nvm alias default 0.10.24
npm install cloudflare-cli -g

# install jq
wget http://stedolan.github.io/jq/download/linux64/jq
chmod +x jq
mv jq /usr/local/bin/
