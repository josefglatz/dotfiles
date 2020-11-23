#!/usr/bin/env bash

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

BREW_PREFIX=$(brew --prefix)

# Create local dotfiles directory
DOTFILES_DIRECTORY_LOCAL=$HOME/.dotfiles_local
if [[ ! -d "$DOTFILES_DIRECTORY_LOCAL" ]]; then
	echo "\nCreating your local ${DOTFILES_DIRECTORY_LOCAL} directory"
	mkdir -p $DOTFILES_DIRECTORY_LOCAL && cp -R $HOME/.dotfiles/Templates/home/.dotfiles_local/README.txt $DOTFILES_DIRECTORY_LOCAL/
	echo "\n\nDone!"
fi

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
if [[ "$OSTYPE" == "darwin"* ]]; then
	echo "obdev Little Snitch for Catalina needs to be installed manually https://obdev.at/downloads/littlesnitch/LittleSnitch-4.6.dmg"
	echo "obdev Little Snitch for Big Sur needs to be installed manually https://obdev.at/downloads/littlesnitch/LittleSnitch-5.0.dmg"
	echo ""
fi

# Install global composer packages
${BREW_PREFIX}/bin/composer global require \
	pyrech/composer-changelogs \
	bramus/mixed-content-scan \
	davidrjonas/composer-lock-diff \
	josefglatz/composer-diff-plugin
echo "\nGlobal composer packages are installed. Some Infos about global composer:\n\n"
composer --version
composer global info -D

# Install composer v1 standalone executable
echo "\nInstall composer v1 executable:\n\n"
source ./configscripts/setup-composer-v1.sh
echo "If all went fine, the executable composer1 is available in your shell environment\n\n"

# .zshrc: Remove from $HOME and symlink .zshrc from ~/.dotfiles
echo "\nDone. Now delete ~/.zshrc and symlink it to dotfiles' folder"
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
echo "\n~/.zshrc file is now symlinked to ~/.dotfiles/.zshrc\n\n"
source ~/.zshrc
ln -snf $HOME/.dotfiles/.bash_profile $HOME/

# Symlink the Mackup config file to the home directory
ln -snf $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set global GIT preferences
echo -e "\Setup GIT config"
ln -snf $HOME/.dotfiles/.gitignore_global $HOME/
ln -snf $HOME/.dotfiles/.gitattributes_global $HOME/
source ./configscripts/setup-gitconfig.sh

# Set preferences by symlink for following tools
# nano, postgresql, sqlite
ln -snf $HOME/.dotfiles/{.nanorc,.psqlrc,.sqliterc} $HOME/

# Setup NVM
source $HOME/.dotfiles/configscripts/setup-nvm.sh

# Setup BROOT
source $HOME/.dotfiles/configscripts/setup-broot.sh

# Setup gnu-bin symlinks (partially gBINARY symlinks)
if [[ "$OSTYPE" == "darwin"* ]]; then
	source $HOME/.dotfiles/configscripts/setup-macos-gnubin-symlinks.sh
fi

# Set macOS preferences
# We will run this last because this will reload the shell
if [[ "$OSTYPE" == "darwin"* ]]; then
	echo "\nRun .macos script"
	source .macos
	echo "\n\n.macos script finalized"

# Finalize installation process by closing some specific processes/apps and reboot machine
	echo -e "\n\nPress return to close terminal app(s) and reboot the system OR press CTRL+C to stop script at this position"
	read
	for app in "Activity Monitor" \
		"iTerm2" \
		"Terminal"; do
		killall "${app}" &> /dev/null
	done
	echo 'Reboot now? (y/n)' && read x && [[ "$x" == "y" ]] && /sbin/reboot;
fi