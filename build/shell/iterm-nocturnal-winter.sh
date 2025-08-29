#!/usr/bin/env bash

# Source:   iterm
# Theme:    Nocturnal Winter
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
    print_osc4 0 "4d/4d/4d"
    print_osc4 1 "f1/2d/52"
    print_osc4 2 "09/cd/7e"
    print_osc4 3 "f5/f1/7a"
    print_osc4 4 "31/82/e0"
    print_osc4 5 "ff/2b/6d"
    print_osc4 6 "09/c8/7a"
    print_osc4 7 "fc/fc/fc"
    print_osc4 8 "80/80/80"
    print_osc4 9 "f1/6d/86"
    print_osc4 10 "0a/e7/8d"
    print_osc4 11 "ff/fc/67"
    print_osc4 12 "60/96/ff"
    print_osc4 13 "ff/78/a2"
    print_osc4 14 "0a/e7/8d"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e6/e5/e5"
    print_osc_rgb 11 "0d/0d/17"
    print_osc_rgb 12 "e6/e5/e5"
    print_osc_rgb 17 "ad/bd/d0"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#4d4d4d"
    print_linux 1 "#f12d52"
    print_linux 2 "#09cd7e"
    print_linux 3 "#f5f17a"
    print_linux 4 "#3182e0"
    print_linux 5 "#ff2b6d"
    print_linux 6 "#09c87a"
    print_linux 7 "#e6e5e5"
    print_linux 8 "#808080"
    print_linux 9 "#f16d86"
    print_linux 10 "#0ae78d"
    print_linux 11 "#fffc67"
    print_linux 12 "#6096ff"
    print_linux 13 "#ff78a2"
    print_linux 14 "#0ae78d"
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
