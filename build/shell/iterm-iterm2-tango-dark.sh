#!/usr/bin/env bash

# Source:   iterm
# Theme:    iTerm2 Tango Dark
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
    print_osc4 1 "d8/1e/00"
    print_osc4 2 "5e/a7/02"
    print_osc4 3 "cf/ae/00"
    print_osc4 4 "42/7a/b3"
    print_osc4 5 "89/65/8e"
    print_osc4 6 "00/a7/aa"
    print_osc4 7 "db/de/d8"
    print_osc4 8 "68/6a/66"
    print_osc4 9 "f5/42/35"
    print_osc4 10 "99/e3/43"
    print_osc4 11 "fd/eb/61"
    print_osc4 12 "84/b0/d8"
    print_osc4 13 "bc/94/b7"
    print_osc4 14 "37/e6/e8"
    print_osc4 15 "f1/f1/f0"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "c1/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d81e00"
    print_linux 2 "#5ea702"
    print_linux 3 "#cfae00"
    print_linux 4 "#427ab3"
    print_linux 5 "#89658e"
    print_linux 6 "#00a7aa"
    print_linux 7 "#ffffff"
    print_linux 8 "#686a66"
    print_linux 9 "#f54235"
    print_linux 10 "#99e343"
    print_linux 11 "#fdeb61"
    print_linux 12 "#84b0d8"
    print_linux 13 "#bc94b7"
    print_linux 14 "#37e6e8"
    print_linux 15 "#f1f1f0"
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
