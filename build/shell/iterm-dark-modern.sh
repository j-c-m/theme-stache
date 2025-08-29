#!/usr/bin/env bash

# Source:   iterm
# Theme:    Dark Modern
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
    print_osc4 0 "27/27/27"
    print_osc4 1 "f7/49/49"
    print_osc4 2 "2e/a0/43"
    print_osc4 3 "9e/6a/03"
    print_osc4 4 "00/78/d4"
    print_osc4 5 "d0/12/73"
    print_osc4 6 "1d/b4/d6"
    print_osc4 7 "cc/cc/cc"
    print_osc4 8 "5d/5d/5d"
    print_osc4 9 "dc/54/52"
    print_osc4 10 "23/d1/8b"
    print_osc4 11 "f5/f5/43"
    print_osc4 12 "3b/8e/ea"
    print_osc4 13 "d6/70/d6"
    print_osc4 14 "29/b8/db"
    print_osc4 15 "e5/e5/e5"

    print_osc_rgb 10 "cc/cc/cc"
    print_osc_rgb 11 "1f/1f/1f"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "3a/3d/41"
    print_osc_rgb 19 "e0/e0/e0"
}

do_linux() {
    print_linux 0 "#272727"
    print_linux 1 "#f74949"
    print_linux 2 "#2ea043"
    print_linux 3 "#9e6a03"
    print_linux 4 "#0078d4"
    print_linux 5 "#d01273"
    print_linux 6 "#1db4d6"
    print_linux 7 "#cccccc"
    print_linux 8 "#5d5d5d"
    print_linux 9 "#dc5452"
    print_linux 10 "#23d18b"
    print_linux 11 "#f5f543"
    print_linux 12 "#3b8eea"
    print_linux 13 "#d670d6"
    print_linux 14 "#29b8db"
    print_linux 15 "#e5e5e5"
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
