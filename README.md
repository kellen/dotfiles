dotfiles
========

Install stow and clone the repo:
```
apt-get install stow
git clone git@github.com:kellen/dotfiles.git ~/projects/dotfiles
```

If this is a new system, `extglob` may need to be enabled:
```
shopt -s extglob
```

If there are top-level directories in `dotfiles`, make these instead
of managing the entire directory with stow:
```
find ~/projects/dotfiles/!(README.md) \
     -mindepth 1 -maxdepth 1 -type d \
     -exec bash -c 'mkdir -p ~/$(basename "$@")' _ {} \;
```

Running `stow` before creating these directories (`~/.ssh`, `~/.vim`, etc) 
results in stow managing the entire directory, which can have undesirable 
side-effects (managed `~/.ssh/id_rsa`, `~/.vim/backup/`)

Finally, run stow:
```
cd ~/projects/dotfiles && stow -t ~ !(README.md)
```

To remove existing links to this project:
```
cd ~/projects/dotfiles && stow -t ~ -D !(README.md)
```
