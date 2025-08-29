#!/usr/bin/env bash

# Source:   iterm
# Theme:    rebecca
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
    print_osc4 0 "12/13/1e"
    print_osc4 1 "dd/77/55"
    print_osc4 2 "04/db/b5"
    print_osc4 3 "f2/e7/b7"
    print_osc4 4 "7a/a5/ff"
    print_osc4 5 "bf/9c/f9"
    print_osc4 6 "56/d3/c2"
    print_osc4 7 "e4/e3/e9"
    print_osc4 8 "66/66/99"
    print_osc4 9 "ff/92/cd"
    print_osc4 10 "01/ea/c0"
    print_osc4 11 "ff/fc/a8"
    print_osc4 12 "69/c0/fa"
    print_osc4 13 "c1/7f/f8"
    print_osc4 14 "8b/fd/e1"
    print_osc4 15 "f4/f2/f9"

    print_osc_rgb 10 "e8/e6/ed"
    print_osc_rgb 11 "29/2a/44"
    print_osc_rgb 12 "b8/9b/f9"
    print_osc_rgb 17 "66/33/99"
    print_osc_rgb 19 "f4/f2/f9"
}

do_linux() {
    print_linux 0 "#12131e"
    print_linux 1 "#dd7755"
    print_linux 2 "#04dbb5"
    print_linux 3 "#f2e7b7"
    print_linux 4 "#7aa5ff"
    print_linux 5 "#bf9cf9"
    print_linux 6 "#56d3c2"
    print_linux 7 "#e8e6ed"
    print_linux 8 "#666699"
    print_linux 9 "#ff92cd"
    print_linux 10 "#01eac0"
    print_linux 11 "#fffca8"
    print_linux 12 "#69c0fa"
    print_linux 13 "#c17ff8"
    print_linux 14 "#8bfde1"
    print_linux 15 "#f4f2f9"
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
