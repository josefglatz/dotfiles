c1() {
    composer selfupdate --1 && composer "$@"
}
c2() {
    composer selfupdate --2 && composer "$@"
}