#!/usr/bin/env bash

DOTFILES_FILE_GIT_CONFIG_LOCAL=~/.gitconfig_local
if [[ ! -f "$DOTFILES_FILE_GIT_CONFIG_LOCAL" ]]; then
	echo -e "\nPlease adjust newly added custom global git config file $DOTFILES_FILE_GIT_CONFIG_LOCAL to your needs"
	cp ./Templates/home/.gitconfig_local ~/
else
	echo -e "\n$DOTFILES_FILE_GIT_CONFIG_LOCAL exists already. File will be kept."
fi

git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.excludesfile "~/.gitignore_global"
git config --global core.excludesfile "~/.gitattributes_global"
git config --global include.path "$DOTFILES_FILE_GIT_CONFIG_LOCAL"

git config --global branch.autosetuprebase "always"
git config --bool --global fetch.prune true
git config --bool --global fetch.pruneTags true


git config --bool --global submodule.recurse true
git config --global submodule.fetchJobs 0

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global color.ui true
git config --bool --global diff-so-fancy.markEmptyLines true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# Styling

# @TODO: git config: setup Kaleidoscope as default mergetool