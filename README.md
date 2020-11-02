# dotfiles Josef Glatz

## Installation

On a sparkling frest installation of macOS:

```
# App Store
# Login to your App Store with your correct Account you're using for the App Store

# The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS).
softwareupdate --all --install --force
xcode-select --install

## Clone repository
git clone https://github.com/josefglatz/dotfiles ~/.dotfiles && cd ~/.dotfiles

# Generating a new SSH key (set passphrase!!!)
ssh-keygen -t rsa -b 4096 -C "$GIT_AUTHOR_EMAIL"

# Adding your SSH key to the SSH-agent
cp -n ./Templates/home/.ssh/config ~/.ssh/config
# follow https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent


# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --skip-chsh

# Run `fresh.sh` to start the installation
```
