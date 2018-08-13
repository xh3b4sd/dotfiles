# dotfiles

Just a little dotfile collection.

## install

The following commands install https://github.com/robbyrussell/oh-my-zsh and the
custom dotfiles of this repo.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir -p ~/projects/xh3b4sd/dotfiles
git clone git@github.com:xh3b4sd/dotfiles.git ~/projects/xh3b4sd/dotfiles
~/projects/xh3b4sd/dotfiles/install.sh
```

## atom

#### install packages
Package backups currently work with https://atom.io/packages/package-sync.

- Open the atom editor.
- Use the shortcut `shift-cmd-space` to open the command palette.
- Type `package sync` to fuzzy find the command to install packages.
- Wait until all packages are installed and relaunch atom.

## TODO

Automatically install https://github.com/bitboxer/de-coding.keylayout on OSX
