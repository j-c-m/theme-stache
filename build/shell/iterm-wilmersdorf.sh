#!/usr/bin/env bash

# Source:   iterm
# Theme:    wilmersdorf
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
    print_osc4 0 "34/37/3e"
    print_osc4 1 "e0/63/83"
    print_osc4 2 "7e/be/bd"
    print_osc4 3 "cc/cc/cc"
    print_osc4 4 "a6/c1/e0"
    print_osc4 5 "e1/c1/ee"
    print_osc4 6 "5b/94/ab"
    print_osc4 7 "ab/ab/ab"
    print_osc4 8 "43/47/50"
    print_osc4 9 "fa/71/93"
    print_osc4 10 "8f/d7/d6"
    print_osc4 11 "d1/df/ff"
    print_osc4 12 "b2/cf/f0"
    print_osc4 13 "ef/cc/fd"
    print_osc4 14 "69/ab/c5"
    print_osc4 15 "d3/d3/d3"

    print_osc_rgb 10 "c6/c6/c6"
    print_osc_rgb 11 "28/2b/33"
    print_osc_rgb 12 "7e/be/bd"
    print_osc_rgb 17 "1f/20/24"
    print_osc_rgb 19 "c6/c6/c6"
}

do_linux() {
    print_linux 0 "#34373e"
    print_linux 1 "#e06383"
    print_linux 2 "#7ebebd"
    print_linux 3 "#cccccc"
    print_linux 4 "#a6c1e0"
    print_linux 5 "#e1c1ee"
    print_linux 6 "#5b94ab"
    print_linux 7 "#c6c6c6"
    print_linux 8 "#434750"
    print_linux 9 "#fa7193"
    print_linux 10 "#8fd7d6"
    print_linux 11 "#d1dfff"
    print_linux 12 "#b2cff0"
    print_linux 13 "#efccfd"
    print_linux 14 "#69abc5"
    print_linux 15 "#d3d3d3"
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
