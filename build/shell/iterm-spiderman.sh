#!/usr/bin/env bash

# Source:   iterm
# Theme:    Spiderman
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
    print_osc4 0 "1b/1d/1e"
    print_osc4 1 "e6/08/13"
    print_osc4 2 "e2/29/28"
    print_osc4 3 "e2/47/56"
    print_osc4 4 "2c/3f/ff"
    print_osc4 5 "24/35/db"
    print_osc4 6 "32/56/ff"
    print_osc4 7 "ff/fe/f6"
    print_osc4 8 "50/53/54"
    print_osc4 9 "ff/03/25"
    print_osc4 10 "ff/33/38"
    print_osc4 11 "fe/3a/35"
    print_osc4 12 "1d/50/ff"
    print_osc4 13 "74/7c/ff"
    print_osc4 14 "61/84/ff"
    print_osc4 15 "ff/ff/f9"

    print_osc_rgb 10 "e3/e3/e3"
    print_osc_rgb 11 "1b/1d/1e"
    print_osc_rgb 12 "2c/3f/ff"
    print_osc_rgb 17 "07/0e/50"
    print_osc_rgb 19 "f0/27/2d"
}

do_linux() {
    print_linux 0 "#1b1d1e"
    print_linux 1 "#e60813"
    print_linux 2 "#e22928"
    print_linux 3 "#e24756"
    print_linux 4 "#2c3fff"
    print_linux 5 "#2435db"
    print_linux 6 "#3256ff"
    print_linux 7 "#e3e3e3"
    print_linux 8 "#505354"
    print_linux 9 "#ff0325"
    print_linux 10 "#ff3338"
    print_linux 11 "#fe3a35"
    print_linux 12 "#1d50ff"
    print_linux 13 "#747cff"
    print_linux 14 "#6184ff"
    print_linux 15 "#fffff9"
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
