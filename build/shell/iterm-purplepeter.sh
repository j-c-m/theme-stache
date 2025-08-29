#!/usr/bin/env bash

# Source:   iterm
# Theme:    purplepeter
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
    print_osc4 0 "0a/05/20"
    print_osc4 1 "ff/79/6d"
    print_osc4 2 "99/b4/81"
    print_osc4 3 "ef/df/ac"
    print_osc4 4 "66/d9/ef"
    print_osc4 5 "e7/8f/cd"
    print_osc4 6 "ba/8c/ff"
    print_osc4 7 "ff/ba/81"
    print_osc4 8 "10/0b/23"
    print_osc4 9 "f9/9f/92"
    print_osc4 10 "b4/be/8f"
    print_osc4 11 "f2/e9/bf"
    print_osc4 12 "79/da/ed"
    print_osc4 13 "ba/91/d4"
    print_osc4 14 "a0/a0/d6"
    print_osc4 15 "b9/ae/d3"

    print_osc_rgb 10 "ec/e7/fa"
    print_osc_rgb 11 "2a/1a/4a"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "86/89/c2"
    print_osc_rgb 19 "27/1c/50"
}

do_linux() {
    print_linux 0 "#0a0520"
    print_linux 1 "#ff796d"
    print_linux 2 "#99b481"
    print_linux 3 "#efdfac"
    print_linux 4 "#66d9ef"
    print_linux 5 "#e78fcd"
    print_linux 6 "#ba8cff"
    print_linux 7 "#ece7fa"
    print_linux 8 "#100b23"
    print_linux 9 "#f99f92"
    print_linux 10 "#b4be8f"
    print_linux 11 "#f2e9bf"
    print_linux 12 "#79daed"
    print_linux 13 "#ba91d4"
    print_linux 14 "#a0a0d6"
    print_linux 15 "#b9aed3"
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
