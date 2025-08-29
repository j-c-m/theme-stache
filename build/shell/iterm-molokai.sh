#!/usr/bin/env bash

# Source:   iterm
# Theme:    Molokai
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
    print_osc4 0 "12/12/12"
    print_osc4 1 "fa/25/73"
    print_osc4 2 "98/e1/23"
    print_osc4 3 "df/d4/60"
    print_osc4 4 "10/80/d0"
    print_osc4 5 "87/00/ff"
    print_osc4 6 "43/a8/d0"
    print_osc4 7 "bb/bb/bb"
    print_osc4 8 "55/55/55"
    print_osc4 9 "f6/66/9d"
    print_osc4 10 "b1/e0/5f"
    print_osc4 11 "ff/f2/6d"
    print_osc4 12 "00/af/ff"
    print_osc4 13 "af/87/ff"
    print_osc4 14 "51/ce/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "bb/bb/bb"
    print_osc_rgb 11 "12/12/12"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "b5/d5/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#121212"
    print_linux 1 "#fa2573"
    print_linux 2 "#98e123"
    print_linux 3 "#dfd460"
    print_linux 4 "#1080d0"
    print_linux 5 "#8700ff"
    print_linux 6 "#43a8d0"
    print_linux 7 "#bbbbbb"
    print_linux 8 "#555555"
    print_linux 9 "#f6669d"
    print_linux 10 "#b1e05f"
    print_linux 11 "#fff26d"
    print_linux 12 "#00afff"
    print_linux 13 "#af87ff"
    print_linux 14 "#51ceff"
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
