#!/usr/bin/env bash

# Source:   iterm
# Theme:    Tango Half Adapted
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
    print_osc4 2 "4c/c3/00"
    print_osc4 3 "e2/c0/00"
    print_osc4 4 "00/8e/f6"
    print_osc4 5 "a9/6c/b3"
    print_osc4 6 "00/bd/c3"
    print_osc4 7 "e0/e5/db"
    print_osc4 8 "79/7d/76"
    print_osc4 9 "ff/00/13"
    print_osc4 10 "8a/f6/00"
    print_osc4 11 "ff/ec/00"
    print_osc4 12 "76/bf/ff"
    print_osc4 13 "d8/98/d1"
    print_osc4 14 "00/f6/fa"
    print_osc4 15 "f4/f4/f2"

    print_osc_rgb 10 "00/00/00"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "00/00/00"
    print_osc_rgb 17 "c1/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ff0000"
    print_linux 2 "#4cc300"
    print_linux 3 "#e2c000"
    print_linux 4 "#008ef6"
    print_linux 5 "#a96cb3"
    print_linux 6 "#00bdc3"
    print_linux 7 "#000000"
    print_linux 8 "#797d76"
    print_linux 9 "#ff0013"
    print_linux 10 "#8af600"
    print_linux 11 "#ffec00"
    print_linux 12 "#76bfff"
    print_linux 13 "#d898d1"
    print_linux 14 "#00f6fa"
    print_linux 15 "#f4f4f2"
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
