export PATH=~/bin:~/.dotnet/tools:$PATH
export LD_LIBRARY_PATH=~/lib/libgl-xlib:${LD_LIBRARY_PATH}
export BROWSER=vimb

[ -f "~./.keys" ] && source "~/.keys"

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh)
    export SSH_AUTH_SOCK
fi
