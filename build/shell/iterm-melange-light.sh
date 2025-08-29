#!/usr/bin/env bash

# Source:   iterm
# Theme:    Melange_light
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
    print_osc4 0 "e9/e1/db"
    print_osc4 1 "c7/7b/8b"
    print_osc4 2 "6e/9b/72"
    print_osc4 3 "bc/5c/00"
    print_osc4 4 "78/92/bd"
    print_osc4 5 "be/79/bb"
    print_osc4 6 "73/97/97"
    print_osc4 7 "7d/66/58"
    print_osc4 8 "a9/8a/78"
    print_osc4 9 "bf/00/21"
    print_osc4 10 "3a/68/4a"
    print_osc4 11 "a0/6d/00"
    print_osc4 12 "46/5a/a4"
    print_osc4 13 "90/41/80"
    print_osc4 14 "3d/65/68"
    print_osc4 15 "54/43/3a"

    print_osc_rgb 10 "54/43/3a"
    print_osc_rgb 11 "f1/f1/f1"
    print_osc_rgb 12 "54/43/3a"
    print_osc_rgb 17 "54/43/3a"
    print_osc_rgb 19 "d9/d3/ce"
}

do_linux() {
    print_linux 0 "#e9e1db"
    print_linux 1 "#c77b8b"
    print_linux 2 "#6e9b72"
    print_linux 3 "#bc5c00"
    print_linux 4 "#7892bd"
    print_linux 5 "#be79bb"
    print_linux 6 "#739797"
    print_linux 7 "#54433a"
    print_linux 8 "#a98a78"
    print_linux 9 "#bf0021"
    print_linux 10 "#3a684a"
    print_linux 11 "#a06d00"
    print_linux 12 "#465aa4"
    print_linux 13 "#904180"
    print_linux 14 "#3d6568"
    print_linux 15 "#54433a"
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
