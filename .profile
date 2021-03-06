export PATH=~/bin:~/.dotnet/tools:~/.local/bin:$PATH
# export LD_LIBRARY_PATH=~/lib/libgl-xlib:${LD_LIBRARY_PATH}

# Default less customizations
export LESS='-r --quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Syntax highlight for less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"

# This is needed for ctag support for the Rust standard library. But it gives too many hits (i.e. for new)
# export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library/

# Load any secret keys I don't want to share on github.
[ -f "~./.keys" ] && source "~/.keys"
