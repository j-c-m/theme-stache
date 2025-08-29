#!/usr/bin/env bash

# Source:   iterm
# Theme:    deep
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
    print_osc4 1 "d7/00/05"
    print_osc4 2 "1c/d9/15"
    print_osc4 3 "d9/bd/26"
    print_osc4 4 "56/65/ff"
    print_osc4 5 "b0/52/da"
    print_osc4 6 "50/d2/da"
    print_osc4 7 "e0/e0/e0"
    print_osc4 8 "53/53/53"
    print_osc4 9 "fb/00/07"
    print_osc4 10 "22/ff/18"
    print_osc4 11 "fe/dc/2b"
    print_osc4 12 "9f/a9/ff"
    print_osc4 13 "e0/9a/ff"
    print_osc4 14 "8d/f9/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "cd/cd/cd"
    print_osc_rgb 11 "09/09/09"
    print_osc_rgb 12 "d0/d0/d0"
    print_osc_rgb 17 "78/00/02"
    print_osc_rgb 19 "ec/ec/ec"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d70005"
    print_linux 2 "#1cd915"
    print_linux 3 "#d9bd26"
    print_linux 4 "#5665ff"
    print_linux 5 "#b052da"
    print_linux 6 "#50d2da"
    print_linux 7 "#cdcdcd"
    print_linux 8 "#535353"
    print_linux 9 "#fb0007"
    print_linux 10 "#22ff18"
    print_linux 11 "#fedc2b"
    print_linux 12 "#9fa9ff"
    print_linux 13 "#e09aff"
    print_linux 14 "#8df9ff"
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
