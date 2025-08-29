#!/usr/bin/env bash

# Source:   iterm
# Theme:    Hybrid
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
    print_osc4 0 "2a/2e/33"
    print_osc4 1 "b8/4d/51"
    print_osc4 2 "b3/bf/5a"
    print_osc4 3 "e4/b5/5e"
    print_osc4 4 "6e/90/b0"
    print_osc4 5 "a1/7e/ac"
    print_osc4 6 "7f/bf/b4"
    print_osc4 7 "b5/b9/b6"
    print_osc4 8 "1d/1f/22"
    print_osc4 9 "8d/2e/32"
    print_osc4 10 "79/84/31"
    print_osc4 11 "e5/8a/50"
    print_osc4 12 "4b/6b/88"
    print_osc4 13 "6e/50/79"
    print_osc4 14 "4d/7b/74"
    print_osc4 15 "5a/62/6a"

    print_osc_rgb 10 "b7/bc/ba"
    print_osc_rgb 11 "16/17/19"
    print_osc_rgb 12 "b7/bc/ba"
    print_osc_rgb 17 "1e/1f/22"
    print_osc_rgb 19 "b7/bc/ba"
}

do_linux() {
    print_linux 0 "#2a2e33"
    print_linux 1 "#b84d51"
    print_linux 2 "#b3bf5a"
    print_linux 3 "#e4b55e"
    print_linux 4 "#6e90b0"
    print_linux 5 "#a17eac"
    print_linux 6 "#7fbfb4"
    print_linux 7 "#b7bcba"
    print_linux 8 "#1d1f22"
    print_linux 9 "#8d2e32"
    print_linux 10 "#798431"
    print_linux 11 "#e58a50"
    print_linux 12 "#4b6b88"
    print_linux 13 "#6e5079"
    print_linux 14 "#4d7b74"
    print_linux 15 "#5a626a"
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
