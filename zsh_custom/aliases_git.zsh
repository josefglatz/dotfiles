# Git
alias git="LANG=C git"
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
#alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias cdgr='cd "$(git root)" && echo "Changed directory to actual git root $(pwd)"'
alias git-config-alias-showall='git config --get-regexp alias'
alias git-config-global-alias-showall='git config --global --get-regexp alias'
alias gcamend="git commit --amend"
#alias wip="commit wip"

# Disable oh-my-zsh git alias
unalias gdt