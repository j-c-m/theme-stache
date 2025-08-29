#!/usr/bin/env bash

# Source:   iterm
# Theme:    jubi
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
    print_osc4 0 "3b/37/50"
    print_osc4 1 "cf/7b/98"
    print_osc4 2 "90/a9/4b"
    print_osc4 3 "6e/bf/c0"
    print_osc4 4 "57/6e/a6"
    print_osc4 5 "bc/4f/68"
    print_osc4 6 "75/a7/d2"
    print_osc4 7 "c3/d3/de"
    print_osc4 8 "a8/74/ce"
    print_osc4 9 "de/90/ab"
    print_osc4 10 "bc/dd/61"
    print_osc4 11 "87/e9/ea"
    print_osc4 12 "8c/9f/cd"
    print_osc4 13 "e1/6c/87"
    print_osc4 14 "b7/c9/ef"
    print_osc4 15 "d5/e5/f1"

    print_osc_rgb 10 "c3/d3/de"
    print_osc_rgb 11 "26/2b/33"
    print_osc_rgb 12 "c3/d3/de"
    print_osc_rgb 17 "5b/51/84"
    print_osc_rgb 19 "1e/1b/2e"
}

do_linux() {
    print_linux 0 "#3b3750"
    print_linux 1 "#cf7b98"
    print_linux 2 "#90a94b"
    print_linux 3 "#6ebfc0"
    print_linux 4 "#576ea6"
    print_linux 5 "#bc4f68"
    print_linux 6 "#75a7d2"
    print_linux 7 "#c3d3de"
    print_linux 8 "#a874ce"
    print_linux 9 "#de90ab"
    print_linux 10 "#bcdd61"
    print_linux 11 "#87e9ea"
    print_linux 12 "#8c9fcd"
    print_linux 13 "#e16c87"
    print_linux 14 "#b7c9ef"
    print_linux 15 "#d5e5f1"
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
