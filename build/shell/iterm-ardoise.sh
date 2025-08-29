#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ardoise
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
    print_osc4 0 "2c/2c/2c"
    print_osc4 1 "d3/32/2d"
    print_osc4 2 "58/8b/35"
    print_osc4 3 "fc/a9/3a"
    print_osc4 4 "24/65/c2"
    print_osc4 5 "73/32/b4"
    print_osc4 6 "64/e1/b8"
    print_osc4 7 "f7/f7/f7"
    print_osc4 8 "53/53/53"
    print_osc4 9 "fa/58/52"
    print_osc4 10 "8d/c2/52"
    print_osc4 11 "ff/ea/51"
    print_osc4 12 "6a/b5/f8"
    print_osc4 13 "be/68/ca"
    print_osc4 14 "89/ff/db"
    print_osc4 15 "fe/fe/fe"

    print_osc_rgb 10 "ea/ea/ea"
    print_osc_rgb 11 "1e/1e/1e"
    print_osc_rgb 12 "f7/f7/f7"
    print_osc_rgb 17 "46/51/5e"
    print_osc_rgb 19 "f1/f3/f5"
}

do_linux() {
    print_linux 0 "#2c2c2c"
    print_linux 1 "#d3322d"
    print_linux 2 "#588b35"
    print_linux 3 "#fca93a"
    print_linux 4 "#2465c2"
    print_linux 5 "#7332b4"
    print_linux 6 "#64e1b8"
    print_linux 7 "#eaeaea"
    print_linux 8 "#535353"
    print_linux 9 "#fa5852"
    print_linux 10 "#8dc252"
    print_linux 11 "#ffea51"
    print_linux 12 "#6ab5f8"
    print_linux 13 "#be68ca"
    print_linux 14 "#89ffdb"
    print_linux 15 "#fefefe"
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
