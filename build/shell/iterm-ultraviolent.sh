#!/usr/bin/env bash

# Source:   iterm
# Theme:    UltraViolent
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
    print_osc4 0 "24/27/28"
    print_osc4 1 "ff/00/90"
    print_osc4 2 "b6/ff/00"
    print_osc4 3 "ff/f7/27"
    print_osc4 4 "47/e0/fb"
    print_osc4 5 "d7/31/ff"
    print_osc4 6 "0e/ff/bb"
    print_osc4 7 "e1/e1/e1"
    print_osc4 8 "63/66/67"
    print_osc4 9 "fb/58/b4"
    print_osc4 10 "de/ff/8c"
    print_osc4 11 "eb/e0/87"
    print_osc4 12 "7f/ec/ff"
    print_osc4 13 "e6/81/ff"
    print_osc4 14 "69/fc/d3"
    print_osc4 15 "f9/f9/f5"

    print_osc_rgb 10 "c1/c1/c1"
    print_osc_rgb 11 "24/27/28"
    print_osc_rgb 12 "c1/c1/c1"
    print_osc_rgb 17 "57/4c/49"
    print_osc_rgb 19 "c3/c7/cb"
}

do_linux() {
    print_linux 0 "#242728"
    print_linux 1 "#ff0090"
    print_linux 2 "#b6ff00"
    print_linux 3 "#fff727"
    print_linux 4 "#47e0fb"
    print_linux 5 "#d731ff"
    print_linux 6 "#0effbb"
    print_linux 7 "#c1c1c1"
    print_linux 8 "#636667"
    print_linux 9 "#fb58b4"
    print_linux 10 "#deff8c"
    print_linux 11 "#ebe087"
    print_linux 12 "#7fecff"
    print_linux 13 "#e681ff"
    print_linux 14 "#69fcd3"
    print_linux 15 "#f9f9f5"
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
