#!/usr/bin/env bash

# Source:   iterm
# Theme:    Phala Green Dark
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
    print_osc4 1 "ab/15/00"
    print_osc4 2 "00/b1/00"
    print_osc4 3 "a9/a7/00"
    print_osc4 4 "02/23/c0"
    print_osc4 5 "c2/2e/c0"
    print_osc4 6 "00/b4/c0"
    print_osc4 7 "cb/cb/cb"
    print_osc4 8 "79/79/79"
    print_osc4 9 "ed/22/00"
    print_osc4 10 "00/db/00"
    print_osc4 11 "ea/e7/00"
    print_osc4 12 "04/33/ff"
    print_osc4 13 "ed/3a/ea"
    print_osc4 14 "00/e8/ea"
    print_osc4 15 "ea/ea/ea"

    print_osc_rgb 10 "c1/fc/03"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "c1/fc/03"
    print_osc_rgb 17 "01/48/04"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#ab1500"
    print_linux 2 "#00b100"
    print_linux 3 "#a9a700"
    print_linux 4 "#0223c0"
    print_linux 5 "#c22ec0"
    print_linux 6 "#00b4c0"
    print_linux 7 "#c1fc03"
    print_linux 8 "#797979"
    print_linux 9 "#ed2200"
    print_linux 10 "#00db00"
    print_linux 11 "#eae700"
    print_linux 12 "#0433ff"
    print_linux 13 "#ed3aea"
    print_linux 14 "#00e8ea"
    print_linux 15 "#eaeaea"
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
