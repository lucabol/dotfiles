#!/bin/zsh
compress() {
    tar cvzf $1.tar.gz $1
}

vman() {
    nvim -c "SuperMan $*"
    if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
    fi
}

browse() {
    lynx -vikeys -accept_all_cookies $1
}

wikipedia() {
    browse "https://en.wikipedia.org/wiki/$@"
}

duckduckgo() {
    browse "https://lite.duckduckgo.com/lite/?q='$@'"
}
