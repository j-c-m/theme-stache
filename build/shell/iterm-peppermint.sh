#!/usr/bin/env bash

# Source:   iterm
# Theme:    Peppermint
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
    print_osc4 0 "35/35/35"
    print_osc4 1 "e7/46/69"
    print_osc4 2 "89/d2/87"
    print_osc4 3 "da/b8/53"
    print_osc4 4 "44/9f/d0"
    print_osc4 5 "da/62/dc"
    print_osc4 6 "65/aa/af"
    print_osc4 7 "b4/b4/b4"
    print_osc4 8 "53/53/53"
    print_osc4 9 "e4/85/9b"
    print_osc4 10 "a3/cc/a2"
    print_osc4 11 "e1/e4/87"
    print_osc4 12 "6f/bc/e2"
    print_osc4 13 "e5/86/e7"
    print_osc4 14 "96/dc/db"
    print_osc4 15 "df/df/df"

    print_osc_rgb 10 "c8/c8/c8"
    print_osc_rgb 11 "00/00/00"
    print_osc_rgb 12 "bb/bb/bb"
    print_osc_rgb 17 "e6/e6/e6"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#353535"
    print_linux 1 "#e74669"
    print_linux 2 "#89d287"
    print_linux 3 "#dab853"
    print_linux 4 "#449fd0"
    print_linux 5 "#da62dc"
    print_linux 6 "#65aaaf"
    print_linux 7 "#c8c8c8"
    print_linux 8 "#535353"
    print_linux 9 "#e4859b"
    print_linux 10 "#a3cca2"
    print_linux 11 "#e1e487"
    print_linux 12 "#6fbce2"
    print_linux 13 "#e586e7"
    print_linux 14 "#96dcdb"
    print_linux 15 "#dfdfdf"
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
