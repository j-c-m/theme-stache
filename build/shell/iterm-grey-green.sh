#!/usr/bin/env bash

# Source:   iterm
# Theme:    Grey-green
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
    print_osc4 0 "00/00/00"
    print_osc4 1 "fe/14/14"
    print_osc4 2 "74/ff/00"
    print_osc4 3 "f1/ff/01"
    print_osc4 4 "00/de/ff"
    print_osc4 5 "ff/00/f0"
    print_osc4 6 "00/ff/bc"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "66/66/66"
    print_osc4 9 "ff/39/39"
    print_osc4 10 "00/ff/44"
    print_osc4 11 "ff/d1/00"
    print_osc4 12 "00/af/ff"
    print_osc4 13 "ff/00/8a"
    print_osc4 14 "00/ff/d3"
    print_osc4 15 "f5/ec/ec"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/2a/1a"
    print_osc_rgb 12 "ff/f4/00"
    print_osc_rgb 17 "51/7e/50"
    print_osc_rgb 19 "e2/e2/e2"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#fe1414"
    print_linux 2 "#74ff00"
    print_linux 3 "#f1ff01"
    print_linux 4 "#00deff"
    print_linux 5 "#ff00f0"
    print_linux 6 "#00ffbc"
    print_linux 7 "#ffffff"
    print_linux 8 "#666666"
    print_linux 9 "#ff3939"
    print_linux 10 "#00ff44"
    print_linux 11 "#ffd100"
    print_linux 12 "#00afff"
    print_linux 13 "#ff008a"
    print_linux 14 "#00ffd3"
    print_linux 15 "#f5ecec"
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
