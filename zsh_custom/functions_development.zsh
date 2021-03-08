# Parse dotenv (./.env) and export line(s) beginning with specific string as environment variable(s)
    # Usage: `loadenv-from-dotenv-lines-begin-with "MYSQL_"`
    #
    #       To load all lines beginning with "MYSQL_": `loadenv-from-dotenv-lines-begin-with "MYSQL_"`
    #       To load all lines beginning with "GFX": `loadenv-from-dotenv-lines-begin-with "GFX"`
    #
loadenv-from-dotenv-lines-begin-with () {
    # Check if argument is given, otherwise "exit" function with return command
    if [ -z "$*" ]; then echo "${RED}This command needs an argument. Aborting now!"; return 1; fi
    # Check if .env file exists in CWD, otherwise "exit" function with return command
    if [ ! -f .env ]; then
        echo "${RED}.env does not exist. Aborting now!"
        return 1
    fi
    set -o allexport
    # - /^#/d                               removes comments (strings that start with #)
    # - /^\s*$/d                            removes empty strings, including whitespace
    # - s/\(\w*\)[ \t]*=[ \t]*\(.*\)/\1=\2/ keep group 1 and 2 before and after the = ignoring the whitespace.
    # - "s/=['\"]\(.*\)['\"]/=\1/g"         value part, removes start/ending single or double quotes
    # - "s/'/'\\\''/g"                      replaces every single quote with ''', which is a trick sequence in bash to produce a quote
    # - "s/=\(.*\)/='\1'/g"                 converts every a=b into a='b'
    eval $(cat '.env' | sed -e '/^#/d;/^\s*$/d' -e 's/\(\w*\)[ \t]*=[ \t]*\(.*\)/\1=\2/' -e "s/=['\"]\(.*\)['\"]/=\1/g" -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g" | grep "^$@")
    set +o allexport

    echo "${GREEN}Done.${RESET} You can now use the variables in you scripts.\n\ne.g. (to import latest sql dump in CWD with usage of exported MYSQL_* env vars):\nmysql -u\$MYSQL_USER -p\$MYSQL_PASSWORD \$MYSQL_DATABASE < ./\$(ls *.sql | sort -n -t _ -k 2 | tail -1)"
}