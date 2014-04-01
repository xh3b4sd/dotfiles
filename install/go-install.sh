#!/bin/bash

$VERSION${1:-"1.2.1"}

export CGO_ENABLED=0
curl -s "https://go.googlecode.com/files/go$VERSION.src.tar.gz" | tar -v -C / -xz && mv /go /goroot
cd /goroot/src && ./make.bash
export GOROOT=/goroot

echo "export PATH=\$PATH:/goroot/bin" >> ~/.bash_profile
