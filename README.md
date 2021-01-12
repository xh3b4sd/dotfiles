# dotfiles

Just a little dotfile collection.



## zsh

Install from https://github.com/robbyrussell/oh-my-zsh.

```
mkdir -p ~/project/xh3b4sd/dotfiles
git clone git@github.com:xh3b4sd/dotfiles.git ~/project/xh3b4sd/dotfiles
~/project/xh3b4sd/dotfiles/install.sh
```

```
git clone https://github.com/zsh-vi-more/vi-increment ~/.oh-my-zsh/custom/plugins/vi-increment
```



## brew

Install from https://brew.sh.

```
brew install aws-iam-authenticator
brew install clang-format
brew install coreutils
brew install fluxcd/tap/flux
brew install git
brew install golangci-lint
brew install grpcurl
brew install helm
brew install jq
brew install kind
brew install kubectl
brew install wget
brew install yq
```



## git

```
$ cat ~/.git-credentials
https://xh3b4sd:<PAT>@github.com
```



## go

- Make sure `go` is installed. See https://github.com/moovweb/gvm.
- Make sure `dlv` is installed. See https://github.com/derekparker/delve/blob/master/Documentation/installation/osx/install.md.
- Make sure `goimports` is installed. See https://pkg.go.dev/golang.org/x/tools/cmd/goimports.



## vscode

Simply install vsCode and enable settings sync using Github Profile. Further, in
the command palette you want to install all tools for the Golang extension.



## iterm

Install from https://www.iterm2.com/downloads.html and configure the profile to
be read from the following path.

```
/Users/xh3b4sd/project/xh3b4sd/dotfiles
```



## font

Install from https://sourcefoundry.org/hack. Simply double click the font files
to install them once downloaded.



## TODO

Automatically install https://github.com/bitboxer/de-coding.keylayout on OSX
