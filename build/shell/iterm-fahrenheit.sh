#!/usr/bin/env bash

# Source:   iterm
# Theme:    Fahrenheit
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
    print_osc4 0 "1d/1d/1d"
    print_osc4 1 "cd/a0/74"
    print_osc4 2 "9e/74/4d"
    print_osc4 3 "fe/cf/75"
    print_osc4 4 "72/01/02"
    print_osc4 5 "73/4c/4d"
    print_osc4 6 "97/97/97"
    print_osc4 7 "ff/ff/ce"
    print_osc4 8 "00/00/00"
    print_osc4 9 "fe/ce/a0"
    print_osc4 10 "cc/73/4d"
    print_osc4 11 "fd/9f/4d"
    print_osc4 12 "cb/4a/05"
    print_osc4 13 "4e/73/9f"
    print_osc4 14 "fe/d0/4d"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ce"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "4e/73/9f"
    print_osc_rgb 19 "ff/ff/ce"
}

do_linux() {
    print_linux 0 "#1d1d1d"
    print_linux 1 "#cda074"
    print_linux 2 "#9e744d"
    print_linux 3 "#fecf75"
    print_linux 4 "#720102"
    print_linux 5 "#734c4d"
    print_linux 6 "#979797"
    print_linux 7 "#ffffce"
    print_linux 8 "#000000"
    print_linux 9 "#fecea0"
    print_linux 10 "#cc734d"
    print_linux 11 "#fd9f4d"
    print_linux 12 "#cb4a05"
    print_linux 13 "#4e739f"
    print_linux 14 "#fed04d"
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
