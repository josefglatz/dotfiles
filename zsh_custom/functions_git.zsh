# Convert GitHub HTTPS repository to SSH
# -------------------------------------------------------
# Based on https://gist.github.com/m14t/3056747
git-fix-github-https-to-ssh() {
    echo "${RED}Updating your git remote url of this git repository${RESET}"
    #The if condition is for checking your remote HTTPS URL has `.git` at the end or not
    if git config --get remote.origin.url | ggrep -P '\.git$' >/dev/null; then
        newURL=`git config --get remote.origin.url | sed -r 's#(http.*://)([^/]+)/(.+)$#git@\2:\3#g'`
    else
        newURL=`git config --get remote.origin.url | sed -r 's#(http.*://)([^/]+)/(.+)$#git@\2:\3.git#g'`
    fi

    echo "Does this new url look fine? (y/n) : " $newURL
    read response
    if [[ "$response" == "y" ]]; then
        git remote set-url origin $newURL
        echo "✅ Git remote updated."
    else
        echo "！Git remote unchanged."
    fi
}