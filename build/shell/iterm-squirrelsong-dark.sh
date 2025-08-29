#!/usr/bin/env bash

# Source:   iterm
# Theme:    Squirrelsong Dark
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
    print_osc4 0 "37/29/20"
    print_osc4 1 "ba/41/38"
    print_osc4 2 "46/83/36"
    print_osc4 3 "d4/b1/39"
    print_osc4 4 "43/95/c6"
    print_osc4 5 "85/5f/b8"
    print_osc4 6 "2f/97/94"
    print_osc4 7 "d3/b9/a2"
    print_osc4 8 "70/4f/39"
    print_osc4 9 "df/4d/43"
    print_osc4 10 "65/9a/4c"
    print_osc4 11 "e8/c2/3f"
    print_osc4 12 "4c/a4/db"
    print_osc4 13 "9d/70/da"
    print_osc4 14 "60/ac/a9"
    print_osc4 15 "f2/d4/bb"

    print_osc_rgb 10 "b1/9b/89"
    print_osc_rgb 11 "37/29/20"
    print_osc_rgb 12 "b1/9b/89"
    print_osc_rgb 17 "5b/40/2e"
    print_osc_rgb 19 "b1/9b/89"
}

do_linux() {
    print_linux 0 "#372920"
    print_linux 1 "#ba4138"
    print_linux 2 "#468336"
    print_linux 3 "#d4b139"
    print_linux 4 "#4395c6"
    print_linux 5 "#855fb8"
    print_linux 6 "#2f9794"
    print_linux 7 "#b19b89"
    print_linux 8 "#704f39"
    print_linux 9 "#df4d43"
    print_linux 10 "#659a4c"
    print_linux 11 "#e8c23f"
    print_linux 12 "#4ca4db"
    print_linux 13 "#9d70da"
    print_linux 14 "#60aca9"
    print_linux 15 "#f2d4bb"
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
