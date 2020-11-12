# dotfiles Josef Glatz

## Read [this ingenious blog post about dotfiles](https://driesvints.com/blog/getting-started-with-dotfiles/) to know when it's time to start using the so called "dotfiles".

## Installation

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update mackup to the latest version and ran `mackup backup`?

On a sparkling frest installation of macOS:

```
# App Store
# Login to your App Store with your correct Account you're using for the App Store

# The Xcode Command Line Tools includes `git` and `make` (not available on stock macOS).
softwareupdate --all --install --force
xcode-select --install

## Clone repository
git clone https://github.com/josefglatz/dotfiles ~/.dotfiles && cd ~/.dotfiles

# Generating a new SSH key (set passphrase!!! and add it to your password vault)
ssh-keygen -t rsa -b 4096 -C "$GIT_AUTHOR_EMAIL"

# Adding your SSH key to the SSH-agent
cp -n ./Templates/home/.ssh/config ~/.ssh/config
# follow https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent


# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --skip-chsh

# Run `./fresh.sh` to start the installation

# Restore preferences by running `mackup restore`

# Restart your computer to finalize the process

Your Mac is now read to use!
```

## Configuration

### File `~/.extra`

This file is needed to keep your private informations or credentials which must be not part of any dotfiles repository.

### Folder `~/bin`

This folder is added to $PATH variable. You can put there your custom executable scripts which are available through PATH variable.

### File `~/.gitconfig_local`

This file can be used to add custom global git config which is not part of the dotfiles repo.

### File `~/.functions_local`

This file can be used to add custom functions which are loaded in oh-my-zsh's custom folder in script functions.zsh.

---

## Reference Links

### prefFiles / plist

* mas: 1157491961 PLIST Editor
* https://discussions.apple.com/thread/4709713 (Use AppleScript to set nested dict's/array/values in plist files)
* https://scriptingosx.com/2016/11/editing-property-lists/ Introduction to `plutil`
* https://shadowfile.inode.link/blog/2018/06/advanced-defaults1-usage/ Possible explanation of writing DICT with `defaults`
* https://support.apple.com/de-de/guide/terminal/apda49a1bb2-577e-4721-8f25-ffc0836f6997/mac Official plist dokumentation Apple
