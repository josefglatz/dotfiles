#!/usr/bin/env zsh

cowsay "Trying to update as much as possible now ...with $(realpath $0)" | lolcat

figlet -f cyberlarge "Apple:" | lolcat
echo "List available Apple Software Updates"
softwareupdate --list
echo "Starting Apple Software Update"
softwareupdate --all --install --force
echo "Update Developer/CommandLineTools"
sudo xcode-select --install

figlet -f cyberlarge "Apple App Store:" | lolcat
echo "${GREEN}Try to upgrade installed App Store applications${RESET}\n"
echo "${YELLOW}Due to a possible bug in mas the upgrade does not work actually\n - (https://github.com/mas-cli/mas/issues/306\n - https://github.com/mas-cli/mas/issues/290\n - https://github.com/mas-cli/mas/issues/252)${RESET}"
mas upgrade
echo "${YELLOW}Please check whether all upgrades are finished by checking manually in App Store.app.\n\nPress enter to open App Store${RESET}"
read
open -a "App Store"
echo "Press enter if you're finshed updating/checking updatesin App Store.app"
read

figlet -f cyberlarge "Homebrew:" | lolcat
echo "${GREEN}Starting Homebrew upgrades${RESET}"
brew update && brew outdated
brew upgrade && brew cleanup
brew doctor
echo "Homebrew upgrades finished\n\n"

figlet -f cyberlarge "Greedy casks:" | lolcat
echo "${RED}There are homebrew cask's which declare themselves to be self-updating${RESET} (known as \"greedy\")${RED}.${RESET}"
echo "${YELLOW}Following homebrew cask's must/can be updated via their auto-update functionality or manually:${RESET}\n"
brew outdated --cask --greedy 
echo "${YELLOW}If you still would like to upgrade a greedy cask\nwith Homebrew just run\n\n e.g. \"${RESET}brew-upgrade-greedy firefox${YELLOW}\"\n\n You can upgrade one by one manually without warranty!"


figlet -f cyberlarge "composer:" | lolcat
echo "Starting global composer updates"
composer --version
composer global update --with-dependencies && composer global outdated -D
echo "composer update finished\n\n"

if test $(which tldr); then
    figlet -f cyberlarge "tldr:" | lolcat
    echo "Starting tldr data updates"
    tldr --update
    echo "tldr data pages finished\n\n"
fi

figlet -f cyberlarge "ZSH plugins:" | lolcat
echo "Starting ZSH plugin updates"
echo "ZSH-PLUGIN alias-tips" && cd $HOME/.dotfiles/zsh_custom/plugins/alias-tips && git pull