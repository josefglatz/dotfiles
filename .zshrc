# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles
# Path to your local dotfiles.
export DOTFILES_DIRECTORY_LOCAL=$HOME/.dotfiles_local
export DOTFILES_LOCAL=$DOTFILES_DIRECTORY_LOCAL

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set oh-my-zsh compfix when setting up via josefglatz/dotfiles
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES/zsh_custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    alias-finder
    brew
    chucknorris
    colored-man-pages
    colorize
    command-not-found
    common-aliases
    composer
    copybuffer
    copydir
    copyfile
    cp
    extract
    fancy-ctrl-z
    fasd
    fzf
    git-extras
    gitfast
    #globalias # Expands all glob expressions, subcommands and aliases (including global).
    gnu-utils
    history
    jsontools
    systemadmin
    thefuck
    tig
    urltools
    wd
    alias-tips
)

source $ZSH/oh-my-zsh.sh

# Enable completions
autoload -Uz compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export VISUAL=nvim
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  export EDITOR=$VISUAL
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Private file for environment variables outside dotfiles repository
# (can be loaded with function "loadenv $HOME/.extra" to export each variable in ~/.extra)
source $HOME/.extra
# After sourcing $HOME/.extra: export only specific as environment variables for now o-o-t-b
export GITHUB_TOKEN=$GITHUB_CLI_TOKEN
export DINGHY_GUEST_MOUNT_DIR=$DINGHY_GUEST_MOUNT_DIR
export DINGHY_HOST_MOUNT_DIR=$DINGHY_HOST_MOUNT_DIR
export GITLAB_TOKEN=$GITLAB_TOKEN
export GITLAB_HOST=$GITLAB_HOST

# Setup docker daemon related environment based on $DOTFILES_ACTIVE_DOCKERHOST (in ~/.extra)
export DOTFILES_ACTIVE_DOCKERHOST=$DOTFILES_ACTIVE_DOCKERHOST
dotfiles-dockerhost-activation

# Homebrew: disables statistics that brew collects
export HOMEBREW_NO_ANALYTICS=1 

# Enable brew formula zsh-history-substring-search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Enable brew formula zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Enable brew formula zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

# Enable brew formula zsh-completions
if type brew &>/dev/null; then
    chmod go-w '/usr/local/share'
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# Enable nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Bindkeying

# ALT-C
bindkey "ç" fzf-cd-widget # Bind ALT-C to interactive directory changer

# ZSH plugin: alias-tips
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Hey you! You have an Alias for that: "
export ZSH_PLUGINS_ALIAS_TIPS_EXCLUDES=(_ ll vi)
export ZSH_PLUGINS_ALIAS_TIPS_FORCE=0 # set to 1 if you want to "learn" your aliases 
export ZSH_PLUGINS_ALIAS_TIPS_REVEAL=1 # set to 1 if you want to see behind the scenes
export ZSH_PLUGINS_ALIAS_TIPS_REVEAL_TEXT="Alias for: "
export ZSH_PLUGINS_ALIAS_TIPS_REVEAL_EXCLUDES=(_ ll vi)