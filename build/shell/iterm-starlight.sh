#!/usr/bin/env bash

# Source:   iterm
# Theme:    starlight
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
    print_osc4 0 "24/24/24"
    print_osc4 1 "f6/2b/5a"
    print_osc4 2 "47/b4/13"
    print_osc4 3 "e3/c4/01"
    print_osc4 4 "24/ac/d4"
    print_osc4 5 "f2/af/fd"
    print_osc4 6 "13/c2/99"
    print_osc4 7 "e6/e6/e6"
    print_osc4 8 "61/61/61"
    print_osc4 9 "ff/4d/51"
    print_osc4 10 "35/d4/50"
    print_osc4 11 "e9/e8/36"
    print_osc4 12 "5d/c5/f8"
    print_osc4 13 "fe/ab/f2"
    print_osc4 14 "24/df/c4"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "ff/ff/ff"
    print_osc_rgb 11 "24/24/24"
    print_osc_rgb 12 "ff/ff/ff"
    print_osc_rgb 17 "ff/ff/ff"
    print_osc_rgb 19 "24/24/24"
}

do_linux() {
    print_linux 0 "#242424"
    print_linux 1 "#f62b5a"
    print_linux 2 "#47b413"
    print_linux 3 "#e3c401"
    print_linux 4 "#24acd4"
    print_linux 5 "#f2affd"
    print_linux 6 "#13c299"
    print_linux 7 "#ffffff"
    print_linux 8 "#616161"
    print_linux 9 "#ff4d51"
    print_linux 10 "#35d450"
    print_linux 11 "#e9e836"
    print_linux 12 "#5dc5f8"
    print_linux 13 "#feabf2"
    print_linux 14 "#24dfc4"
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
