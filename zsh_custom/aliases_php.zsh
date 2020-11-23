alias cfresh="rm -rf vendor/ composer.lock && composer i"
#alias php74="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:7.4"
#alias php8="docker run -it -w /data -v ${PWD}:/data:delegated --entrypoint php --rm registry.gitlab.com/grahamcampbell/php:8.0"

# run composer without defacto no memory_limit
alias composer="php -d memory_limit=-1 $(brew --prefix)/bin/composer"
# run standalone composer v1 executable with no memory limit
alias composer1="php -d memory_limit=-1 /usr/bin/composer1"