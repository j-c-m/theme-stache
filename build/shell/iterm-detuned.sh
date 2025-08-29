#!/usr/bin/env bash

# Source:   iterm
# Theme:    detuned
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
    print_osc4 0 "17/17/17"
    print_osc4 1 "fe/43/86"
    print_osc4 2 "a6/e3/2d"
    print_osc4 3 "e6/da/73"
    print_osc4 4 "00/94/d9"
    print_osc4 5 "9b/37/ff"
    print_osc4 6 "50/b7/d9"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "68/68/68"
    print_osc4 9 "fa/80/ac"
    print_osc4 10 "bd/e3/71"
    print_osc4 11 "ff/f2/7f"
    print_osc4 12 "00/be/ff"
    print_osc4 13 "be/9e/ff"
    print_osc4 14 "5e/d7/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "c7/c7/c7"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c7/c7/c7"
    print_osc_rgb 17 "c1/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#171717"
    print_linux 1 "#fe4386"
    print_linux 2 "#a6e32d"
    print_linux 3 "#e6da73"
    print_linux 4 "#0094d9"
    print_linux 5 "#9b37ff"
    print_linux 6 "#50b7d9"
    print_linux 7 "#c7c7c7"
    print_linux 8 "#686868"
    print_linux 9 "#fa80ac"
    print_linux 10 "#bde371"
    print_linux 11 "#fff27f"
    print_linux 12 "#00beff"
    print_linux 13 "#be9eff"
    print_linux 14 "#5ed7ff"
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
