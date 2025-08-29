#!/usr/bin/env bash

# Source:   iterm
# Theme:    Sakura
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
    print_osc4 1 "d5/23/70"
    print_osc4 2 "41/af/1a"
    print_osc4 3 "bc/70/53"
    print_osc4 4 "69/64/ab"
    print_osc4 5 "c7/1f/bf"
    print_osc4 6 "93/93/93"
    print_osc4 7 "99/8e/ac"
    print_osc4 8 "78/6d/69"
    print_osc4 9 "f4/1d/99"
    print_osc4 10 "22/e5/29"
    print_osc4 11 "f5/95/74"
    print_osc4 12 "98/92/f1"
    print_osc4 13 "e9/0c/dd"
    print_osc4 14 "ee/ee/ee"
    print_osc4 15 "cb/b6/ff"

    print_osc_rgb 10 "dd/7b/dc"
    print_osc_rgb 11 "18/13/1e"
    print_osc_rgb 12 "ff/65/fd"
    print_osc_rgb 17 "c0/5c/bf"
    print_osc_rgb 19 "24/24/2e"
}

do_linux() {
    print_linux 0 "#000000"
    print_linux 1 "#d52370"
    print_linux 2 "#41af1a"
    print_linux 3 "#bc7053"
    print_linux 4 "#6964ab"
    print_linux 5 "#c71fbf"
    print_linux 6 "#939393"
    print_linux 7 "#dd7bdc"
    print_linux 8 "#786d69"
    print_linux 9 "#f41d99"
    print_linux 10 "#22e529"
    print_linux 11 "#f59574"
    print_linux 12 "#9892f1"
    print_linux 13 "#e90cdd"
    print_linux 14 "#eeeeee"
    print_linux 15 "#cbb6ff"
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
