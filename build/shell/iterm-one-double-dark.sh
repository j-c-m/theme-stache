#!/usr/bin/env bash

# Source:   iterm
# Theme:    One Double Dark
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
    print_osc4 0 "3d/44/52"
    print_osc4 1 "f1/63/72"
    print_osc4 2 "8c/c5/70"
    print_osc4 3 "ec/be/70"
    print_osc4 4 "3f/b1/f5"
    print_osc4 5 "d3/73/e3"
    print_osc4 6 "17/b9/c4"
    print_osc4 7 "db/df/e5"
    print_osc4 8 "52/5d/6f"
    print_osc4 9 "ff/77/7b"
    print_osc4 10 "82/d8/82"
    print_osc4 11 "f5/c0/65"
    print_osc4 12 "6d/ca/ff"
    print_osc4 13 "ff/7b/f4"
    print_osc4 14 "00/e5/fb"
    print_osc4 15 "f7/f9/fc"

    print_osc_rgb 10 "db/df/e5"
    print_osc_rgb 11 "28/2c/34"
    print_osc_rgb 12 "f5/e0/dc"
    print_osc_rgb 17 "58/5b/70"
    print_osc_rgb 19 "cd/d6/f4"
}

do_linux() {
    print_linux 0 "#3d4452"
    print_linux 1 "#f16372"
    print_linux 2 "#8cc570"
    print_linux 3 "#ecbe70"
    print_linux 4 "#3fb1f5"
    print_linux 5 "#d373e3"
    print_linux 6 "#17b9c4"
    print_linux 7 "#dbdfe5"
    print_linux 8 "#525d6f"
    print_linux 9 "#ff777b"
    print_linux 10 "#82d882"
    print_linux 11 "#f5c065"
    print_linux 12 "#6dcaff"
    print_linux 13 "#ff7bf4"
    print_linux 14 "#00e5fb"
    print_linux 15 "#f7f9fc"
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
