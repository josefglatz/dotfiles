#!/usr/bin/env zsh

autoload colors
source $HOME/.dotfiles/zsh_custom/shell_colors.zsh

# @TODO: add check for Parallels (general availability)
# @TODO: add check for Parallels license

if test $(which dinghy); then
    # https://productiveness.josefglatz.at/migrate-from-webdevops-vagrant-docker-vm-to-codekitchen-dinghy-4da3a9e91feb
    echo "Setup dinghy development environment" | lolcat
    source ~/.extra



    echo "Checking dependencies..."
    brew-is-formula-installed docker
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        echo "\n✅ brew formula docker installed."
    else
        echo "\n\n${RED}docker not installed${RESET}"
        exit 1
    fi
    brew-is-formula-installed docker-machine
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        echo "✅ brew formula docker-machine installed."
    else
        echo "\n\n${RED}docker-machine not installed${RESET}"
        exit 1
    fi
    brew-is-formula-installed docker-machine-parallels
    RESULT=$?
    if [ $RESULT -eq 0 ]; then
        echo "✅ brew formula docker-machine-parallels installed."
    else
        echo "\n\n${RED}docker-machine-parallels not installed${RESET}"
        exit 1
    fi


    DOTFILES_FILE_DINGHY_PREFERENCES=$HOME/.dinghy/preferences.yml
    echo "\nSet up dinghy preferences $DOTFILES_FILE_DINGHY_PREFERENCES file..."
    if [[ ! -f "$DOTFILES_FILE_DINGHY_PREFERENCES" ]]; then
        print "\nPlease adjust newly added file template $DOTFILES_FILE_DINGHY_PREFERENCES to your needs ${RED}in an extra terminal window${RESET} and press enter if you finished it."
        mkdir -p $HOME/.dinghy || true
        cp $HOME/.dotfiles/Templates/home/.dinghy/preferences.yml $DOTFILES_FILE_DINGHY_PREFERENCES
        read
    else
        print "\n${YELLOW}$DOTFILES_FILE_DINGHY_PREFERENCES already exists"
        bat $DOTFILES_FILE_DINGHY_PREFERENCES
    fi

    echo "\n\n${GREEN}Dinghy initial setup done.${RESET} It's time to create and start your dinghy VM. For further instructions head over to https://productiveness.josefglatz.at/migrate-from-webdevops-vagrant-docker-vm-to-codekitchen-dinghy-4da3a9e91feb#754c"




    # @TODO: add vagrant-parallels check if parallels is already installed
    # read "reply?Do you want to install the following vagrant plugin? (vagrant-parallels) Parallels Desktop needs to be installed (and licensed) [y/n] "
    # echo    # (optional) move to a new line
    # if [[ $reply =~ ^[Yy]$ ]]
    # then
    #     vagrant plugin install vagrant-parallels
    # fi
    
fi
