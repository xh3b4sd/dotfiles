# dotfiles

Just a little dotfile collection.

## zsh

The following commands install https://github.com/robbyrussell/oh-my-zsh and the
custom dotfiles of this repo.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir -p ~/projects/xh3b4sd/dotfiles
git clone git@github.com:xh3b4sd/dotfiles.git ~/projects/xh3b4sd/dotfiles
~/projects/xh3b4sd/dotfiles/install.sh
```

## brew

The following commands install https://brew.sh.

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## atom

#### install packages

Package backups currently work with https://atom.io/packages/package-sync, which
has to be installed as the very first package in order to use it for restoring
the other atom packages.

- Open the atom editor.
- Use the shortcut `shift-cmd-space` to open the command palette.
- Type `package sync` to fuzzy find the command to install packages.
- Wait until all packages are installed and relaunch atom.

## font

Install the hack font from https://sourcefoundry.org/hack. Simply double click
the font files to install them once downloaded.

## TODO

Automatically install https://github.com/bitboxer/de-coding.keylayout on OSX
