#!/usr/bin/env bash

# Source:   iterm
# Theme:    Solarized Dark - Patched
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
    print_osc4 0 "00/28/31"
    print_osc4 1 "d1/1c/24"
    print_osc4 2 "73/8a/05"
    print_osc4 3 "a5/77/06"
    print_osc4 4 "21/76/c7"
    print_osc4 5 "c6/1c/6f"
    print_osc4 6 "25/92/86"
    print_osc4 7 "ea/e3/cb"
    print_osc4 8 "47/5b/62"
    print_osc4 9 "bd/36/13"
    print_osc4 10 "47/5b/62"
    print_osc4 11 "53/68/70"
    print_osc4 12 "70/82/84"
    print_osc4 13 "59/56/ba"
    print_osc4 14 "81/90/90"
    print_osc4 15 "fc/f4/dc"

    print_osc_rgb 10 "70/82/84"
    print_osc_rgb 11 "00/1e/27"
    print_osc_rgb 12 "70/82/84"
    print_osc_rgb 17 "00/28/31"
    print_osc_rgb 19 "81/90/90"
}

do_linux() {
    print_linux 0 "#002831"
    print_linux 1 "#d11c24"
    print_linux 2 "#738a05"
    print_linux 3 "#a57706"
    print_linux 4 "#2176c7"
    print_linux 5 "#c61c6f"
    print_linux 6 "#259286"
    print_linux 7 "#708284"
    print_linux 8 "#475b62"
    print_linux 9 "#bd3613"
    print_linux 10 "#475b62"
    print_linux 11 "#536870"
    print_linux 12 "#708284"
    print_linux 13 "#5956ba"
    print_linux 14 "#819090"
    print_linux 15 "#fcf4dc"
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
