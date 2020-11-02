#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Source or add ~/.extra file for local ENV vars and other not present stuff in dotfiles repo
DOTFILES_FILE_EXT=~/.extra
if [[ ! -f "$DOTFILES_FILE_EXT" ]]; then
	echo "\nPlease adjust newly added file template ~/.extra to your needs"
	cp ./Templates/home/.extra ~/.extra
	echo "\nopen ~/.extra\n\nedit the file and run this script again!"
	exit
else
	echo "\n\n Sourcing ~/.extra file"
	source ~/.extra
fi


# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Inform about not installable applications
echo ""
echo "obdev Little Snitch for Catalina needs to be installed manually https://obdev.at/downloads/littlesnitch/LittleSnitch-4.6.dmg"
echo "obdev Little Snitch for Big Sur needs to be installed manually https://obdev.at/downloads/littlesnitch/LittleSnitch-5.0.dmg"
echo ""
