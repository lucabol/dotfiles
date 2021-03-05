export PATH=~/bin:~/.dotnet/tools:$PATH
export FINNHUBKEY=sandbox_c0t3npn48v6r4maejkjg
export LD_LIBRARY_PATH=~/lib/libgl-xlib:${LD_LIBRARY_PATH}
export BROWSER=vimb

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
