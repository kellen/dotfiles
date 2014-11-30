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
stow tmux
stow xmodmap
```

And for vim:
```
mkdir ~/.vim
stow vim
```
