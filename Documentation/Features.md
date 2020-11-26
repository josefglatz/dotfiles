# Features (Document still work in progress)

## General Productivity

### Shell

#### ZSH General

* Ctrl-x,Ctrl-l to insert output of last command

#### Colors

[shell_colors.zsh for coloring shell output like print, echo](../zsh_custom/shell_colors.zsh)

#### Navigation

##### `fif` AKA `find-in-file` in current directory

Like grep but with more fun it possible to find text in files of CWD:

```bash
fif <SEARCH_TERM>
find-in-file <SEARCH_TERM> # alternative alias
```
[Found at medium.com](https://medium.com/better-programming/boost-your-command-line-productivity-with-fuzzy-finder-985aa162ba5d#e100)

##### ALT-C to change to any subdirectory of CWD

Built on fzf it's possible to just press ALT-C and you can use fzf's feature to select a subdirectory you want to CD.

* Given you're in folder ~/.dotfiles
* Pressing ALT-C makes it possible to start selecting a subdirectory within fzf

##### `fda` AKA `find-directory-all` to search also for hidden directories

```bash
fda
```

### Development

### GIT

#### Shell GIT "UI" `lazygit` (`lg`)

Open with `lg` or lazygit when you're in an GIT repository.

More information lazygit:
* [Introduction Video](https://youtu.be/CPLdltN7wgE)
* [Usage](https://github.com/jesseduffield/lazygit/#usage)

#### GIT aliases and functions


### Translation and Languages

**Shell translation tools**

* `transe` or `tre` English > German
* `transd` or `trd` German > English

## macOS

### dotfiles/apps/etc.

#### Function "bundleid"

Search for a bundleId by app name. Handy when working with plist files, defaults, ...

#### Function "whichapp"

Search for an installed application by name `finder` or bundleId `com.apple.finder`. If found, the full path is returned. Also the exitcode can be used in other scripts. E.g. when running some scripts only if an app is available on your system.