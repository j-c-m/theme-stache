#!/usr/bin/env bash

# Source:   iterm
# Theme:    Elegant
# Author:   unknown
# Variant:  dark

# Exit if not on a tty

if [[ ! -t 0 ]]; then
    exit 0
fi

print_osc4() {
    local color="$1"
    local hexterm="$2"

    printf "\033]4;%d;rgb:%s\033\\" "$color" "$hexterm"
}

print_osc_rgb() {
    local osc="$1"
    local hexterm="$2"

    printf "\033]%d;rgb:%s\033\\" "$osc" "$hexterm"
}

print_linux() {
    local color="$1"
    local hex="$2"

    printf "\033]P%x%s" "$color" "${hex#\#}"
}

do_osc() {
    print_osc4 0 "0a/12/22"
    print_osc4 1 "ff/02/57"
    print_osc4 2 "85/cc/95"
    print_osc4 3 "ff/cb/8b"
    print_osc4 4 "8d/ab/e1"
    print_osc4 5 "c7/92/eb"
    print_osc4 6 "78/cc/f0"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "57/56/56"
    print_osc4 9 "ff/00/57"
    print_osc4 10 "85/cc/95"
    print_osc4 11 "ff/cb/8b"
    print_osc4 12 "8d/ab/e1"
    print_osc4 13 "c7/92/eb"
    print_osc4 14 "3f/ac/ef"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ce/d2/d6"
    print_osc_rgb 11 "29/2b/31"
    print_osc_rgb 12 "00/be/ff"
    print_osc_rgb 17 "d5/d5/d5"
    print_osc_rgb 19 "14/43/85"
}

do_linux() {
    print_linux 0 "#0a1222"
    print_linux 1 "#ff0257"
    print_linux 2 "#85cc95"
    print_linux 3 "#ffcb8b"
    print_linux 4 "#8dabe1"
    print_linux 5 "#c792eb"
    print_linux 6 "#78ccf0"
    print_linux 7 "#ced2d6"
    print_linux 8 "#575656"
    print_linux 9 "#ff0057"
    print_linux 10 "#85cc95"
    print_linux 11 "#ffcb8b"
    print_linux 12 "#8dabe1"
    print_linux 13 "#c792eb"
    print_linux 14 "#3facef"
    print_linux 15 "#ffffff"
}

case "$TERM" in
    linux*)
        do_linux
        ;;
    *)
        do_osc
        ;;
esac

unset -f print_osc4
unset -f print_osc_rgb
unset -f print_linux
unset -f do_osc
unset -f do_linux
