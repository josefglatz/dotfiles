#!/usr/bin/env bash

DOTFILES_FILE_GIT_CONFIG_LOCAL=~/.gitconfig_local
if [[ ! -f "$DOTFILES_FILE_GIT_CONFIG_LOCAL" ]]; then
	echo -e "\nPlease adjust newly added custom global git config file $DOTFILES_FILE_GIT_CONFIG_LOCAL to your needs"
	cp ./Templates/home/.gitconfig_local ~/
else
	echo -e "\n$DOTFILES_FILE_GIT_CONFIG_LOCAL exists already. File will be kept."
fi

source ~/.extra


git config --global user.name "$GIT_AUTHOR_NAME"
git config --global user.email "$GIT_AUTHOR_EMAIL"
git config --global core.excludesfile "~/.gitignore_global"
git config --global core.attributesfile "~/.gitattributes_global"
git config --global include.path "$DOTFILES_FILE_GIT_CONFIG_LOCAL"

git config --global core.editor nvim

git config --global branch.autosetuprebase "always"
git config --bool --global fetch.prune true
git config --bool --global fetch.pruneTags true
git config --global init.defaultBranch "main"


git config --bool --global submodule.recurse true
git config --global submodule.fetchJobs 0

#git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
# Use git-delta instead of diff-so-fancy
git config --global core.pager "delta"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.plus-color "#012800"
git config --global delta.minus-color "#340001"
git config --global delta.syntax-theme Monokai\ Extended

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

git config --global push.default "upstream"   # 'git push' will push the current branch to its tracking branch. the usual default is to push all branches

#
# git Aliases
#

# 
git config --global alias.aa 'add --all'
git config --global alias.ap 'add --patch'
git config --global alias.ai 'add --interactive'
git config --global alias.fp 'push --force-with-lease' # gently force push
git config --global alias.uncommit 'reset --soft HEAD^' # go back before last commit, with files in uncommitted state
# Branches
git config --global alias.branches 'for-each-ref --sort=-committerdate --format="%(color:blue)%(authordate:relative)\t%(color:red)%(authorname)${TAB} %(color:white)%(color:bold)%(refname:short)" refs/remotes'
# Local branches sorted by last modified
git config --global alias.b "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"
# Find text in any commit ever
git config --global alias.grep-all "!f(){ git rev-list --all | xargs git grep \$1; }; f"

# For repos without subject body commits (vim repo, git-svn clones)
git config --global alias.logt "log --graph --color --format=\"%C(auto)%h %d %<|(100,trunc) %s\""
git config --global alias.logta "log --graph --color --format=\"%C(auto)%h %d %<|(100,trunc) %s\" --all"
git config --global alias.logsa "log --graph --color --format=\"%C(auto)%h %d %<|(100,trunc) %s\" --all --simplify-by-decoration"
# Styling

# @TODO: git config: setup Kaleidoscope as default mergetool