# dotfiles

Just a little dotfile collection.



## zsh

Install from https://github.com/robbyrussell/oh-my-zsh.

```
mkdir -p ~/projects/xh3b4sd/dotfiles
git clone git@github.com:xh3b4sd/dotfiles.git ~/projects/xh3b4sd/dotfiles
~/projects/xh3b4sd/dotfiles/install.sh
```



## brew

Install from https://brew.sh.

```
brew install jq
brew install yq
brew install wget
brew install coreutils
brew install mercurial
brew install kubernetes-cli
brew install kubernetes-helm
```



## kubectl

In case installing `kubectl` above does not provide the right version, go with
the following.

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.11.0/bin/darwin/amd64/kubectl
```



## helm

In case installing `helm` above does not provide the right version, go with the
following.

```
export DESIRED_VERSION=v2.8.2
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash
```



## kind

- Make sure `kind` is installed. See https://kind.sigs.k8s.io/docs/user/quick-start.



## go

- Make sure `go` is installed. See https://github.com/moovweb/gvm.
- Make sure `dlv` is installed. See https://github.com/derekparker/delve/blob/master/Documentation/installation/osx/install.md.
- Make sure `dep` is installed. See https://github.com/golang/dep.



## atom

- Make sure `atom` is installed. See https://atom.io.

#### install packages

Package backups currently work with https://atom.io/packages/package-sync, which
has to be installed as the very first package in order to use it for restoring
the other atom packages.

- Open the atom editor.
- Use the shortcut `shift-cmd-space` to open the command palette.
- Type `package sync` to fuzzy find the command to install packages.
- Wait until all packages are installed and relaunch atom.



## iterm

Install from https://www.iterm2.com/downloads.html and configure the profile to
be read from the following path.

```
/Users/xh3b4sd/projects/xh3b4sd/dotfiles
```



## font

Install from https://sourcefoundry.org/hack. Simply double click the font files
to install them once downloaded.



## TODO

Automatically install https://github.com/bitboxer/de-coding.keylayout on OSX
