#!/usr/bin/env bash

# Source:   iterm
# Theme:    heeler
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
    print_osc4 1 "e4/4c/2e"
    print_osc4 2 "bd/d1/00"
    print_osc4 3 "f4/ce/65"
    print_osc4 4 "5b/a5/f2"
    print_osc4 5 "ff/95/c2"
    print_osc4 6 "ff/97/63"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "00/00/00"
    print_osc4 9 "e4/4c/2e"
    print_osc4 10 "bd/d1/00"
    print_osc4 11 "f4/ce/65"
    print_osc4 12 "00/88/ff"
    print_osc4 13 "ff/95/c2"
    print_osc4 14 "8d/a6/e4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "fd/fd/fd"
    print_osc_rgb 11 "21/1f/46"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "2b/2c/41"
    print_osc_rgb 19 "2e/ff/58"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#e44c2e"
    print_linux 2 "#bdd100"
    print_linux 3 "#f4ce65"
    print_linux 4 "#5ba5f2"
    print_linux 5 "#ff95c2"
    print_linux 6 "#ff9763"
    print_linux 7 "#fdfdfd"
    print_linux 8 "#000000"
    print_linux 9 "#e44c2e"
    print_linux 10 "#bdd100"
    print_linux 11 "#f4ce65"
    print_linux 12 "#0088ff"
    print_linux 13 "#ff95c2"
    print_linux 14 "#8da6e4"
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
