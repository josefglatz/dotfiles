
# Update existing "typo3/cms-*" packages to the given version
    # Usage: `typo3-composer-update-core-packages-in-version 10.4.10`
    #
    #   - cd into dir of composer.json
    #   - run command to update TYPO3 core packages to a specific version
typo3-composer-update-core-packages-in-version () {
    echo "Trying to update all found typo3/cms-* packages to version $@"
    composer upd $( jq '.require' composer.json | jq -r 'keys[]' | grep 'typo3/cms-' | xargs printf "%s:$@ ") --with-all-dependencies
}


# Require existing "typo3/cms-*" packages in the given version (especially when you want to downgrade)
    # Usage: `typo3-composer-require-core-packages-in-version 10.4.10`
    #
    #   - cd into dir of composer.json
    #   - run command to require TYPO3 core packages in a specific version
typo3-composer-require-core-packages-in-version () {
    echo "Trying to update all found typo3/cms-* packages to version $@"
    composer req $( jq '.require' composer.json | jq -r 'keys[]' | grep 'typo3/cms-' | xargs printf "%s:$@ ")
}