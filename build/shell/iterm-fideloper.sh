#!/usr/bin/env bash

# Source:   iterm
# Theme:    Fideloper
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
    print_osc4 0 "29/2f/33"
    print_osc4 1 "cb/1e/2d"
    print_osc4 2 "ed/b8/ac"
    print_osc4 3 "b7/ab/9b"
    print_osc4 4 "2e/78/c2"
    print_osc4 5 "c0/23/6f"
    print_osc4 6 "30/91/86"
    print_osc4 7 "ea/e3/ce"
    print_osc4 8 "09/20/28"
    print_osc4 9 "d4/60/5a"
    print_osc4 10 "d4/60/5a"
    print_osc4 11 "a8/66/71"
    print_osc4 12 "7c/85/c4"
    print_osc4 13 "5c/5d/b2"
    print_osc4 14 "81/90/90"
    print_osc4 15 "fc/f4/df"

    print_osc_rgb 10 "db/da/e0"
    print_osc_rgb 11 "29/2f/33"
    print_osc_rgb 12 "d4/60/5a"
    print_osc_rgb 17 "ef/b8/ac"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#292f33"
    print_linux 1 "#cb1e2d"
    print_linux 2 "#edb8ac"
    print_linux 3 "#b7ab9b"
    print_linux 4 "#2e78c2"
    print_linux 5 "#c0236f"
    print_linux 6 "#309186"
    print_linux 7 "#dbdae0"
    print_linux 8 "#092028"
    print_linux 9 "#d4605a"
    print_linux 10 "#d4605a"
    print_linux 11 "#a86671"
    print_linux 12 "#7c85c4"
    print_linux 13 "#5c5db2"
    print_linux 14 "#819090"
    print_linux 15 "#fcf4df"
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
