#!/usr/bin/env bash

# Source:   iterm
# Theme:    Pro Light
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
    print_osc4 1 "e5/49/2b"
    print_osc4 2 "50/d1/48"
    print_osc4 3 "c6/c4/40"
    print_osc4 4 "3b/75/ff"
    print_osc4 5 "ed/66/e8"
    print_osc4 6 "4e/d2/de"
    print_osc4 7 "dc/dc/dc"
    print_osc4 8 "9f/9f/9f"
    print_osc4 9 "ff/66/40"
    print_osc4 10 "61/ef/57"
    print_osc4 11 "f2/f1/56"
    print_osc4 12 "00/82/ff"
    print_osc4 13 "ff/7e/ff"
    print_osc4 14 "61/f7/f8"
    print_osc4 15 "f2/f2/f2"

    print_osc_rgb 10 "19/19/19"
    print_osc_rgb 11 "ff/ff/ff"
    print_osc_rgb 12 "4d/4d/4d"
    print_osc_rgb 17 "c1/dd/ff"
    print_osc_rgb 19 "19/19/19"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e5492b"
    print_linux 2 "#50d148"
    print_linux 3 "#c6c440"
    print_linux 4 "#3b75ff"
    print_linux 5 "#ed66e8"
    print_linux 6 "#4ed2de"
    print_linux 7 "#191919"
    print_linux 8 "#9f9f9f"
    print_linux 9 "#ff6640"
    print_linux 10 "#61ef57"
    print_linux 11 "#f2f156"
    print_linux 12 "#0082ff"
    print_linux 13 "#ff7eff"
    print_linux 14 "#61f7f8"
    print_linux 15 "#f2f2f2"
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
