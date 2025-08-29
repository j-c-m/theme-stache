#!/usr/bin/env bash

# Source:   iterm
# Theme:    Ryuuko
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
    print_osc4 0 "2c/39/41"
    print_osc4 1 "86/5f/5b"
    print_osc4 2 "66/90/7d"
    print_osc4 3 "b1/a9/90"
    print_osc4 4 "6a/8e/95"
    print_osc4 5 "b1/8a/73"
    print_osc4 6 "88/b2/ac"
    print_osc4 7 "ec/ec/ec"
    print_osc4 8 "5d/70/79"
    print_osc4 9 "86/5f/5b"
    print_osc4 10 "66/90/7d"
    print_osc4 11 "b1/a9/90"
    print_osc4 12 "6a/8e/95"
    print_osc4 13 "b1/8a/73"
    print_osc4 14 "88/b2/ac"
    print_osc4 15 "ec/ec/ec"

    print_osc_rgb 10 "ec/ec/ec"
    print_osc_rgb 11 "2c/39/41"
    print_osc_rgb 12 "ec/ec/ec"
    print_osc_rgb 17 "00/28/31"
    print_osc_rgb 19 "81/90/90"
}

do_linux() {
    print_linux 0 "#2c3941"
    print_linux 1 "#865f5b"
    print_linux 2 "#66907d"
    print_linux 3 "#b1a990"
    print_linux 4 "#6a8e95"
    print_linux 5 "#b18a73"
    print_linux 6 "#88b2ac"
    print_linux 7 "#ececec"
    print_linux 8 "#5d7079"
    print_linux 9 "#865f5b"
    print_linux 10 "#66907d"
    print_linux 11 "#b1a990"
    print_linux 12 "#6a8e95"
    print_linux 13 "#b18a73"
    print_linux 14 "#88b2ac"
    print_linux 15 "#ececec"
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
