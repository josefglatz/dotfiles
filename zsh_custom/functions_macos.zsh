if [[ "$OSTYPE" == "darwin"* ]]; then
	# Live syslog on specific process
    # -------------------------------------------------
    # e.g. `log-stream-info-process "TextExpander"`
    function log-stream-info-process {
        log stream --info --predicate 'process=="$1"'
    }

    # Find problematic plist files with plutil
    # ----------------------------------------
    function plist-check {
        echo "Searching for problematic plist files:"
        plutil -s $HOME/Library/Preferences/*.plist

        echo "\n\n  You can run \"plist-delete-problematic\" to delete found problematic plist files."
    }
    alias defaults-check="plist-check"

    # Delete problematic plist files
    # ------------------------------
    function plist-delete-problematic {
        trash `plutil -s $HOME/Library/Preferences/*.plist | grep 'plist:' | sed 's/://g'`
    }
    alias defaults-delete-problematic="plist-delete-problematic"

    # CD into Finder's top most window
    # ------------------------------
    cdf () {
        finderPath=`osascript -e 'tell application "Finder"
            try
                set currentFolder to (folder of the front window as alias)
            on error
                set currentFolder to (path to desktop folder as alias)
            end try
            POSIX path of currentFolder
            end tell'`;
        cd "$finderPath"
    }
fi