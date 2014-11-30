dotfiles
========

First:
```
apt-get install stow
```

Then:
```
cd ~
git clone git@github.com:kellen/dotfiles.git
```

Finally:
```
cd ~/dotfiles
stow bash
stow git
stow mutt
stow screen
stow ssh
stow xmodmap
```

And for vim:
```
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/backup
stow vim
```
