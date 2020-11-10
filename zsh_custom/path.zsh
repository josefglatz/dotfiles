# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# add rust compiled binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Make sure coreutils are loaded before system commands
# I've disabled this for now because I only use "ls" which is
# referenced in my aliases.zsh file directly.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Add .dotfiles' bin folder to PATH
export PATH="$DOTFILES/bin:$PATH"
# Add custom bin folder to PATH
export PATH="$HOME/bin:$PATH"