#!/usr/bin/env bash

ZSH_PLUGIN_ALIASTIPS_DIRECTORY="$HOME/.dotfiles/zsh_custom/plugins/alias-tips"
if [[ ! -d "$ZSH_PLUGIN_ALIASTIPS_DIRECTORY" ]]; then
	echo "\nCreating directory $ZSH_PLUGIN_ALIASTIPS_DIRECTORY directory"
	mkdir -p "$ZSH_PLUGIN_ALIASTIPS_DIRECTORY"
fi
echo "\n\nCloning GIT repo"
git clone https://github.com/djui/alias-tips.git "$ZSH_PLUGIN_ALIASTIPS_DIRECTORY/"