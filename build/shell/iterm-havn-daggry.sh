#!/usr/bin/env bash

# Source:   iterm
# Theme:    Havn Daggry
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
    print_osc4 0 "1f/28/42"
    print_osc4 1 "98/52/48"
    print_osc4 2 "57/71/59"
    print_osc4 3 "be/6b/00"
    print_osc4 4 "3a/57/7d"
    print_osc4 5 "7c/5c/97"
    print_osc4 6 "92/57/80"
    print_osc4 7 "d6/db/eb"
    print_osc4 8 "1f/28/42"
    print_osc4 9 "cc/4a/35"
    print_osc4 10 "71/96/79"
    print_osc4 11 "fe/b2/34"
    print_osc4 12 "60/89/c0"
    print_osc4 13 "7d/73/96"
    print_osc4 14 "aa/86/9d"
    print_osc4 15 "d6/db/eb"

    print_osc_rgb 10 "3b/4a/7a"
    print_osc_rgb 11 "f8/f9/fb"
    print_osc_rgb 12 "22/6c/4f"
    print_osc_rgb 17 "cf/e9/dd"
    print_osc_rgb 19 "31/3c/64"
}

do_linux() {
    print_linux 0 "#1f2842"
    print_linux 1 "#985248"
    print_linux 2 "#577159"
    print_linux 3 "#be6b00"
    print_linux 4 "#3a577d"
    print_linux 5 "#7c5c97"
    print_linux 6 "#925780"
    print_linux 7 "#3b4a7a"
    print_linux 8 "#1f2842"
    print_linux 9 "#cc4a35"
    print_linux 10 "#719679"
    print_linux 11 "#feb234"
    print_linux 12 "#6089c0"
    print_linux 13 "#7d7396"
    print_linux 14 "#aa869d"
    print_linux 15 "#d6dbeb"
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
