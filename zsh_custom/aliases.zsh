# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub | echo '=> Public key copied to pasteboard.'"
alias pubkey="copyssh"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias xattr-delete="sudo xattr -r -d com.apple.quarantine"
alias cpwd="copydir"
alias mkdir="mkdir -p"
alias cask="brew cask"
alias zip="zip -x *.DS_Store -x *__MACOSX* -x *.AppleDouble*"
# Recursively remove Apple meta files
alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanupad="find . -type d -name '.AppleD*' -ls -exec /bin/rm -r {} \;"
# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
# Quick-Look preview files from the command line
alias ql="qlmanage -p &>/dev/null"
# Kill all the tabs in Chrome to free up memory
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
# Show system information
alias displays="system_profiler SPDisplaysDataType"
alias cpu="sysctl -n machdep.cpu.brand_string"
alias ram="top -l 1 -s 0 | grep PhysMem"
# Use gnu-sed instead of BSD's sed
if test $(which gsed); then
  alias sed="gsed"
fi
# Use neovim instead of vim
if test $(which nvim); then
  alias vim="nvim"
  alias vi="nvim"
fi
alias e="$EDITOR"
# Use trash instead of rm
if test $(which trash); then
  alias trash="move-to-trash"
fi
if test $(which prettyping); then
  alias ping="prettyping"
  alias ping6="prettyping -6"
fi

alias pbspaces="pbpaste | expand | pbcopy"

# Directories
alias dotfiles="cd $DOTFILES"
alias dotfilesl="cd $DOTFILES_LOCAL"
alias dotfileslocal="dotfilesl"
alias update-my-mac=". dotfiles-regular-upgrade.sh"
alias library="cd $HOME/Library"
#alias sites="cd $HOME/Sites"
#alias lara="sites && cd laravel/"
#alias docs="lara && cd docs/"

# Laravel
#alias a="php artisan"
#alias fresh="php artisan migrate:fresh --seed"
#alias seed="php artisan db:seed"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
#alias watch="npm run watch"

# XML
# Pretty print XML (use `jq` for json):
alias xq="xmllint --format"

# Vagrant
alias v="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

# Docker
alias docker-composer="docker-compose"
alias d-c="docker-compose"