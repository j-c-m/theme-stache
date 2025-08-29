#!/usr/bin/env bash

# Source:   iterm
# Theme:    IRIX Terminal
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
    print_osc4 0 "1a/19/19"
    print_osc4 1 "ff/2b/1e"
    print_osc4 2 "57/ff/3d"
    print_osc4 3 "ff/ff/44"
    print_osc4 4 "00/04/ff"
    print_osc4 5 "ff/2c/ff"
    print_osc4 6 "56/ff/ff"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "ff/ff/44"
    print_osc4 9 "ff/ff/44"
    print_osc4 10 "ff/ff/44"
    print_osc4 11 "ff/fc/72"
    print_osc4 12 "ff/ff/44"
    print_osc4 13 "ff/ff/44"
    print_osc4 14 "ff/ff/44"
    print_osc4 15 "ff/ff/44"

    print_osc_rgb 10 "f2/f2/f2"
    print_osc_rgb 11 "00/00/43"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "c2/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#1a1919"
    print_linux 1 "#ff2b1e"
    print_linux 2 "#57ff3d"
    print_linux 3 "#ffff44"
    print_linux 4 "#0004ff"
    print_linux 5 "#ff2cff"
    print_linux 6 "#56ffff"
    print_linux 7 "#f2f2f2"
    print_linux 8 "#ffff44"
    print_linux 9 "#ffff44"
    print_linux 10 "#ffff44"
    print_linux 11 "#fffc72"
    print_linux 12 "#ffff44"
    print_linux 13 "#ffff44"
    print_linux 14 "#ffff44"
    print_linux 15 "#ffff44"
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
