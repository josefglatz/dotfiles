#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
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
