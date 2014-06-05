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
wget --no-verbose https://go.googlecode.com/files/go1.2.src.tar.gz
tar -v -C /usr/local -xzf go1.2.src.tar.gz > /dev/null
cd /usr/local/go/src && ./make.bash --no-clean 2>&1 > /dev/null
echo "export PATH=$PATH:/usr/local/go/bin" > /etc/bash.bashrc
rm go1.2.src.tar.gz

# update docker
curl -s https://get.docker.io/ubuntu/ | sudo sh

groupadd docker
gpasswd -a $USER docker
service docker restart

# set default editor
update-alternatives --set editor /usr/bin/vim.basic
