#!/usr/bin/env bash

# Source:   iterm
# Theme:    iTerm2 Smoooooth
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
    print_osc4 0 "14/19/1e"
    print_osc4 1 "b4/3c/2a"
    print_osc4 2 "00/c2/00"
    print_osc4 3 "c7/c4/00"
    print_osc4 4 "27/44/c7"
    print_osc4 5 "c0/40/be"
    print_osc4 6 "00/c5/c7"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "68/68/68"
    print_osc4 9 "dd/79/75"
    print_osc4 10 "58/e7/90"
    print_osc4 11 "ec/e1/00"
    print_osc4 12 "a7/ab/f2"
    print_osc4 13 "e1/7e/e1"
    print_osc4 14 "60/fd/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "dc/dc/dc"
    print_osc_rgb 11 "15/19/1f"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "b3/d7/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#14191e"
    print_linux 1 "#b43c2a"
    print_linux 2 "#00c200"
    print_linux 3 "#c7c400"
    print_linux 4 "#2744c7"
    print_linux 5 "#c040be"
    print_linux 6 "#00c5c7"
    print_linux 7 "#dcdcdc"
    print_linux 8 "#686868"
    print_linux 9 "#dd7975"
    print_linux 10 "#58e790"
    print_linux 11 "#ece100"
    print_linux 12 "#a7abf2"
    print_linux 13 "#e17ee1"
    print_linux 14 "#60fdff"
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
