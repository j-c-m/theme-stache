#!/usr/bin/env bash

# Source:   iterm
# Theme:    Havn Skumring
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
    print_osc4 0 "25/2c/47"
    print_osc4 1 "ea/56/3e"
    print_osc4 2 "6e/ad/7b"
    print_osc4 3 "f8/b3/30"
    print_osc4 4 "59/6c/f7"
    print_osc4 5 "7c/71/9e"
    print_osc4 6 "d5/88/c1"
    print_osc4 7 "dc/e0/ee"
    print_osc4 8 "1f/28/42"
    print_osc4 9 "d1/72/64"
    print_osc4 10 "8c/9e/8f"
    print_osc4 11 "ea/c5/8c"
    print_osc4 12 "51/86/cb"
    print_osc4 13 "9b/7c/ee"
    print_osc4 14 "d1/7a/b6"
    print_osc4 15 "ff/f6/e1"

    print_osc_rgb 10 "d6/db/eb"
    print_osc_rgb 11 "11/15/22"
    print_osc_rgb 12 "27/7a/6f"
    print_osc_rgb 17 "2b/51/4b"
    print_osc_rgb 19 "dc/e0/ef"
}

do_linux() {
    print_linux 0 "#252c47"
    print_linux 1 "#ea563e"
    print_linux 2 "#6ead7b"
    print_linux 3 "#f8b330"
    print_linux 4 "#596cf7"
    print_linux 5 "#7c719e"
    print_linux 6 "#d588c1"
    print_linux 7 "#d6dbeb"
    print_linux 8 "#1f2842"
    print_linux 9 "#d17264"
    print_linux 10 "#8c9e8f"
    print_linux 11 "#eac58c"
    print_linux 12 "#5186cb"
    print_linux 13 "#9b7cee"
    print_linux 14 "#d17ab6"
    print_linux 15 "#fff6e1"
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
