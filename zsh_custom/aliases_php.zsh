alias cfresh="rm -rf vendor/ composer.lock && composer i"
#alias php74="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:7.4"
#alias php8="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:8.0"

# run composer without defacto no memory_limit
alias composer="php -d memory_limit=-1 $(brew --prefix)/bin/composer"
# run standalone composer v1 executable with no memory limit
alias composer1="php -d memory_limit=-1 /usr/local/bin/composer1"



#
# webdevops/clitools based aliases (based on https://github.com/webdevops/clitools/blob/master/Documentation/ALIASES.md)
#

# Shortcut for docker-compose (autosearch docker-compose.yml in up-dir, you don't have to be in directory with docker-compose.yml)
alias dcc='ct docker:compose'

# Startup docker-container
alias dccup='ct docker:up'
# Startup docker-container and shutdown previous one
alias dccswitch='ct docker:up --switch'
# Stop docker-container
alias dccstop='ct docker:compose stop'

# Enter main docker container (as CLI_USER if available - if not specified then root is used)
alias dcshell='ct docker:shell'
alias dcsh='ct docker:shell'

# Enter main docker container (as root)
alias dcroot='ct docker:root'

# Execute predefined cli in docker container
alias dccrun='ct docker:cli'
alias dcrun='ct docker:cli'

# Run command
alias dcexec='ct docker:exec'

# Execute mysql client in docker container
alias dcsql='ct docker:mysql'
alias dcmysql='ct docker:mysql'

# General shortcuts (with up-dir tree searching)
alias make='ct make'