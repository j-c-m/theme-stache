#!/usr/bin/env bash

# Source:   iterm
# Theme:    BlulocoDark
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
    print_osc4 0 "41/44/4d"
    print_osc4 1 "fc/2f/52"
    print_osc4 2 "25/a4/5c"
    print_osc4 3 "ff/93/6a"
    print_osc4 4 "34/76/ff"
    print_osc4 5 "7a/82/da"
    print_osc4 6 "44/83/aa"
    print_osc4 7 "cd/d4/e0"
    print_osc4 8 "8f/9a/ae"
    print_osc4 9 "ff/64/80"
    print_osc4 10 "3f/c5/6b"
    print_osc4 11 "f9/c8/59"
    print_osc4 12 "10/b1/fe"
    print_osc4 13 "ff/78/f8"
    print_osc4 14 "5f/b9/bc"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "b9/c0/cb"
    print_osc_rgb 11 "28/2c/34"
    print_osc_rgb 12 "ff/cc/00"
    print_osc_rgb 17 "b9/c0/ca"
    print_osc_rgb 19 "27/2b/33"
}

do_linux() {
    print_linux 0 "#41444d"
    print_linux 1 "#fc2f52"
    print_linux 2 "#25a45c"
    print_linux 3 "#ff936a"
    print_linux 4 "#3476ff"
    print_linux 5 "#7a82da"
    print_linux 6 "#4483aa"
    print_linux 7 "#b9c0cb"
    print_linux 8 "#8f9aae"
    print_linux 9 "#ff6480"
    print_linux 10 "#3fc56b"
    print_linux 11 "#f9c859"
    print_linux 12 "#10b1fe"
    print_linux 13 "#ff78f8"
    print_linux 14 "#5fb9bc"
    print_linux 15 "#ffffff"
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
