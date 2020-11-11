
mkdir -p $HOME/.config/broot
ln -snf $HOME/.dotfiles/.config/broot/conf.toml $HOME/.config/broot/

# br shell function for broot already added manually within zsh_custom/functions.zsh
# now just tell broot the br function is installed already
broot --set-install-state installed