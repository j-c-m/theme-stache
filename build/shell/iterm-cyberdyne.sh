#!/usr/bin/env bash

# Source:   iterm
# Theme:    Cyberdyne
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
    print_osc4 0 "08/08/08"
    print_osc4 1 "ff/83/73"
    print_osc4 2 "00/c1/72"
    print_osc4 3 "d2/a7/00"
    print_osc4 4 "00/71/cf"
    print_osc4 5 "ff/90/fe"
    print_osc4 6 "6b/ff/dd"
    print_osc4 7 "f1/f1/f1"
    print_osc4 8 "2e/2e/2e"
    print_osc4 9 "ff/c4/be"
    print_osc4 10 "d6/fc/ba"
    print_osc4 11 "ff/fe/d5"
    print_osc4 12 "c2/e3/ff"
    print_osc4 13 "ff/b2/fe"
    print_osc4 14 "e6/e7/fe"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "00/ff/92"
    print_osc_rgb 11 "15/11/44"
    print_osc_rgb 12 "00/ff/9c"
    print_osc_rgb 17 "45/4d/96"
    print_osc_rgb 19 "f4/f4/f4"
}

do_linux() {
    print_linux 0 "#080808"
    print_linux 1 "#ff8373"
    print_linux 2 "#00c172"
    print_linux 3 "#d2a700"
    print_linux 4 "#0071cf"
    print_linux 5 "#ff90fe"
    print_linux 6 "#6bffdd"
    print_linux 7 "#00ff92"
    print_linux 8 "#2e2e2e"
    print_linux 9 "#ffc4be"
    print_linux 10 "#d6fcba"
    print_linux 11 "#fffed5"
    print_linux 12 "#c2e3ff"
    print_linux 13 "#ffb2fe"
    print_linux 14 "#e6e7fe"
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
