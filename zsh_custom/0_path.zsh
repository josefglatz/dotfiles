# path, the 0 in the filename causes this to load first

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}

export PATH="/usr/local/sbin:$PATH"

# Add dotfiles' bin folder
export PATH="$DOTFILES/bin:$PATH"

# Load Composer tools
export PATH="$(composer global config bin-dir --absolute --quiet):$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# add rust compiled binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Add keg-only sqlite to PATH
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')

# Add custom (local) bin folder to PATH
if [[ -d "$HOME/.dotfiles_local/bin" ]]; then
  export PATH="$HOME/.dotfiles_local/bin:$PATH"
fi

# Add .dotfiles' bin folder to PATH
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"