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

la(){ ls -AFgh --group-directories-first  --color=always "$@" | less ; }
ll(){ ls -Fgh --group-directories-first --color=always "$@" | less ; }
lss(){ ls -Fh --group-directories-first --color=always "$@" ; }
ct(){ cargo test --color=always "$@" |& less ; }
cr(){ cargo run --color=always "$@" |& less ; }
cb(){ cargo check --color=always "$@" |& less ; }
