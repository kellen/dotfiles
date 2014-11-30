dotfiles
========

First:
```
apt-get install stow
git clone git@github.com:kellen/dotfiles.git ~/projects/dotfiles
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
