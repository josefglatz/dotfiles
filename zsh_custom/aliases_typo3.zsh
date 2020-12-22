#
# TYPO3 composer commands
#

# composer update typo3/cms core packages in an existing project
alias typo3-composer-update-core-packages="composer u typo3/cms-* --with-all-dependencies"


#
# TYPO3 Sites Configuration
#

# grep multiple domains recursively in PWD and output string between single quotes
    # Built for getting all absolute domains in TYPO3 site configuration files when executed
    # in "$(git root)/app/config/sites" folder:
alias typo3-sites-domains="grep -R 'http' . | sed -n \"s/^.*'\(.*\)'.*$/\1/p\" | sort"

# grep used locale values, remove duplicate entries and sort alphabetically
    # Built for getting all locale values within TYPO3 site configuration files when executed
    # in "$(git root)/app/config/sites" folder:
alias typo3-sites-locales="grep -R 'locale' . | sed -n \"s/^.*locale\:\(\)/\1/p\" | uniq -u | sort"