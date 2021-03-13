dotfiles-dockerhost-activation () {
    # Check if environment variable is not set
    if [ -z "$DOTFILES_ACTIVE_DOCKERHOST" ]
    then
        # Inform the user that no specific docker daemon configuration is set
        echo "${GREEN}No specific docker daemon configuration loaded.${RESET} No dinghy and no special docker. Have fun with 🐬 Docker Desktop for Mac!"
    else
        if [ "$DOTFILES_ACTIVE_DOCKERHOST" = "dinghy" ]
            then
                d-env-dinghy
                echo "\n🐳 ${BLUE} Docker daemon in use: ${RESET}$DOTFILES_ACTIVE_DOCKERHOST\n"
            else
                # @TODO: add more available options
                echo "\n${RED}Can't handle docker daemon configuration with ${RESET}\$DOTFILES_ACTIVE_DOCKERHOST=\"${YELLOW}$DOTFILES_ACTIVE_DOCKERHOST${RESET}\"\n${RED}${YELLOW}(Please check the setting in $HOME./extra)\n"
        fi
fi
}