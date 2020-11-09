#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

BREW_PREFIX=$(brew --prefix)

# Source or add ~/.extra file for local ENV vars and other not present stuff in dotfiles repo
DOTFILES_FILE_EXT=~/.extra
if [[ ! -f "$DOTFILES_FILE_EXT" ]]; then
	echo "\nPlease adjust newly added file template ~/.extra to your needs"
	cp ./Templates/home/.extra ~/.extra
	echo "\nopen ~/.extra\n\nedit the file and run this script again!"
	exit
else
	echo "\n Sourcing ~/.extra file"
	source ~/.extra
fi


# Update Homebrew recipes
echo "\nRun brew update and upgrade first"
brew update && brew upgrade

# Install all our dependencies with bundle (See Brewfile)
echo "\nTake care of homebrew/bundle and run installation process for\n- brew formula\n- brew cask\n- whalebrew\n- mas"
brew tap homebrew/bundle
brew bundle

# Inform about not installable applications
echo "obdev Little Snitch for Catalina needs to be installed manually https://obdev.at/downloads/littlesnitch/LittleSnitch-4.6.dmg"
echo "obdev Little Snitch for Big Sur needs to be installed manually https://obdev.at/downloads/littlesnitch/LittleSnitch-5.0.dmg"
echo ""

# Install global composer packages
${BREW_PREFIX}/bin/composer global require \
	pyrech/composer-changelogs \
	bramus/mixed-content-scan \
	davidrjonas/composer-lock-diff \
	josefglatz/composer-diff-plugin

# Symlink the Mackup config file to the home directory
ln -snf $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
echo "\nRun .macos script"
source .macos
echo "\n\n.macos script finalized"