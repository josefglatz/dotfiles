#!/usr/bin/env bash

NVM_LATEST_VERSION=$(curl --silent "https://api.github.com/repos/nvm-sh/nvm/releases/latest" | jq -r .tag_name)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/$NVM_LATEST_VERSION/install.sh | bash

if [ $RESULT -eq 0 ]; then
    echo "Setup nvm environment" | lolcat
    mkdir ~/.nvm || true
    nvm install 12
    nvm install 13
    nvm install 14
fi

# See $HOME/.dotfiles/.zshrc for other specific activation