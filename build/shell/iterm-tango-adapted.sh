#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tango Adapted
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "ff/00/00"
    print_osc4 2 "59/d6/00"
    print_osc4 3 "f0/cb/00"
    print_osc4 4 "00/a2/ff"
    print_osc4 5 "c1/7e/cc"
    print_osc4 6 "00/d0/d6"
    print_osc4 7 "e6/eb/e1"
    print_osc4 8 "8f/92/8b"
    print_osc4 9 "ff/00/13"
    print_osc4 10 "93/ff/00"
    print_osc4 11 "ff/f1/21"
    print_osc4 12 "88/c9/ff"
    print_osc4 13 "e9/a7/e1"
    print_osc4 14 "00/fe/ff"
    print_osc4 15 "f6/f6/f4"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "c1/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff0000"
    print_linux 2 "#59d600"
    print_linux 3 "#f0cb00"
    print_linux 4 "#00a2ff"
    print_linux 5 "#c17ecc"
    print_linux 6 "#00d0d6"
    print_linux 7 "#000000"
    print_linux 8 "#8f928b"
    print_linux 9 "#ff0013"
    print_linux 10 "#93ff00"
    print_linux 11 "#fff121"
    print_linux 12 "#88c9ff"
    print_linux 13 "#e9a7e1"
    print_linux 14 "#00feff"
    print_linux 15 "#f6f6f4"
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
