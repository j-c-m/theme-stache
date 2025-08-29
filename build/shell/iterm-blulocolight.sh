#!/usr/bin/env bash

# Source:   iterm
# Theme:    BlulocoLight
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "37/3a/41"
    print_osc4 1 "d5/27/53"
    print_osc4 2 "23/97/4a"
    print_osc4 3 "df/63/1c"
    print_osc4 4 "27/5f/e4"
    print_osc4 5 "82/3f/f1"
    print_osc4 6 "27/61/8d"
    print_osc4 7 "ba/bb/c2"
    print_osc4 8 "67/6a/77"
    print_osc4 9 "ff/64/80"
    print_osc4 10 "3c/bc/66"
    print_osc4 11 "c5/a3/32"
    print_osc4 12 "00/99/e1"
    print_osc4 13 "ce/33/c0"
    print_osc4 14 "6d/93/bb"
    print_osc4 15 "d3/d3/d3"

    print_osc_rgb 10 "37/3a/41"
    print_osc_rgb 11 "f9/f9/f9"
    print_osc_rgb 12 "f3/27/59"
    print_osc_rgb 17 "da/f0/ff"
    print_osc_rgb 19 "37/3a/41"
}

do_linux() {
    print_linux 0 "#373a41"
    print_linux 1 "#d52753"
    print_linux 2 "#23974a"
    print_linux 3 "#df631c"
    print_linux 4 "#275fe4"
    print_linux 5 "#823ff1"
    print_linux 6 "#27618d"
    print_linux 7 "#373a41"
    print_linux 8 "#676a77"
    print_linux 9 "#ff6480"
    print_linux 10 "#3cbc66"
    print_linux 11 "#c5a332"
    print_linux 12 "#0099e1"
    print_linux 13 "#ce33c0"
    print_linux 14 "#6d93bb"
    print_linux 15 "#d3d3d3"
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
