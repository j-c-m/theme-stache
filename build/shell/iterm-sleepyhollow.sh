#!/usr/bin/env bash

# Source:   iterm
# Theme:    SleepyHollow
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
    print_osc4 0 "57/21/00"
    print_osc4 1 "ba/39/34"
    print_osc4 2 "91/77/3f"
    print_osc4 3 "b5/56/00"
    print_osc4 4 "5f/63/b4"
    print_osc4 5 "a1/7c/7b"
    print_osc4 6 "8f/ae/a9"
    print_osc4 7 "af/9a/91"
    print_osc4 8 "4e/4b/61"
    print_osc4 9 "d9/44/3f"
    print_osc4 10 "d6/b0/4e"
    print_osc4 11 "f6/68/13"
    print_osc4 12 "80/86/ef"
    print_osc4 13 "e2/c2/bb"
    print_osc4 14 "a4/dc/e7"
    print_osc4 15 "d2/c7/a9"

    print_osc_rgb 10 "af/9a/91"
    print_osc_rgb 11 "12/12/14"
    print_osc_rgb 12 "af/9a/91"
    print_osc_rgb 17 "57/52/56"
    print_osc_rgb 19 "d2/c7/a9"
}

do_linux() {
    print_linux 0 "#572100"
    print_linux 1 "#ba3934"
    print_linux 2 "#91773f"
    print_linux 3 "#b55600"
    print_linux 4 "#5f63b4"
    print_linux 5 "#a17c7b"
    print_linux 6 "#8faea9"
    print_linux 7 "#af9a91"
    print_linux 8 "#4e4b61"
    print_linux 9 "#d9443f"
    print_linux 10 "#d6b04e"
    print_linux 11 "#f66813"
    print_linux 12 "#8086ef"
    print_linux 13 "#e2c2bb"
    print_linux 14 "#a4dce7"
    print_linux 15 "#d2c7a9"
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
