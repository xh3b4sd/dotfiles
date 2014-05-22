#!/bin/sh

# install tools
apt-get update
apt-get install -y git mercurial ack-grep curl

# install dotfiles
mkdir -p ~/projects/private/
cd ~/projects/private
git clone https://github.com/zyndiecate/dotfiles.git
cd dotfiles
sh ./install.sh /home/vagrant

# install go
wget --no-verbose https://go.googlecode.com/files/go1.2.src.tar.gz
tar -v -C /usr/local -xzf go1.2.src.tar.gz
cd /usr/local/go/src && ./make.bash --no-clean 2>&1
echo "export PATH=$PATH:/usr/local/go/bin" > /etc/bash.bashrc

# update docker
curl -s https://get.docker.io/ubuntu/ | sudo sh
