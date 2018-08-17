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
brew install wget
brew install coreutils
brew install mercurial
brew install kubernetes-cli
```

## go

Install from https://golang.org/doc/install.

- Make sure `dlv` is installed. See https://github.com/derekparker/delve/blob/master/Documentation/installation/osx/install.md.

## atom

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
