#!/usr/bin/env bash

# Source:   iterm
# Theme:    Melange_dark
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
    print_osc4 0 "34/30/2c"
    print_osc4 1 "bd/81/83"
    print_osc4 2 "78/99/7a"
    print_osc4 3 "e4/9b/5d"
    print_osc4 4 "7f/91/b2"
    print_osc4 5 "b3/80/b0"
    print_osc4 6 "7b/96/95"
    print_osc4 7 "c1/a7/8e"
    print_osc4 8 "86/74/62"
    print_osc4 9 "d4/77/66"
    print_osc4 10 "85/b6/95"
    print_osc4 11 "eb/c0/6d"
    print_osc4 12 "a3/a9/ce"
    print_osc4 13 "cf/9b/c2"
    print_osc4 14 "89/b3/b6"
    print_osc4 15 "ec/e1/d7"

    print_osc_rgb 10 "ec/e1/d7"
    print_osc_rgb 11 "29/25/22"
    print_osc_rgb 12 "ec/e1/d7"
    print_osc_rgb 17 "ec/e1/d7"
    print_osc_rgb 19 "40/3a/36"
}

do_linux() {
    print_linux 0 "#34302c"
    print_linux 1 "#bd8183"
    print_linux 2 "#78997a"
    print_linux 3 "#e49b5d"
    print_linux 4 "#7f91b2"
    print_linux 5 "#b380b0"
    print_linux 6 "#7b9695"
    print_linux 7 "#ece1d7"
    print_linux 8 "#867462"
    print_linux 9 "#d47766"
    print_linux 10 "#85b695"
    print_linux 11 "#ebc06d"
    print_linux 12 "#a3a9ce"
    print_linux 13 "#cf9bc2"
    print_linux 14 "#89b3b6"
    print_linux 15 "#ece1d7"
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
