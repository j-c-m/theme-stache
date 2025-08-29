#!/usr/bin/env bash

# Source:   iterm
# Theme:    Vague
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
    print_osc4 0 "14/14/15"
    print_osc4 1 "df/68/82"
    print_osc4 2 "8c/b6/6d"
    print_osc4 3 "f3/be/7c"
    print_osc4 4 "7e/98/e8"
    print_osc4 5 "c3/c3/d5"
    print_osc4 6 "9b/b4/bc"
    print_osc4 7 "cd/cd/cd"
    print_osc4 8 "87/87/87"
    print_osc4 9 "df/68/82"
    print_osc4 10 "8c/b6/6d"
    print_osc4 11 "f3/be/7c"
    print_osc4 12 "7e/98/e8"
    print_osc4 13 "c3/c3/d5"
    print_osc4 14 "9b/b4/bc"
    print_osc4 15 "cd/cd/cd"

    print_osc_rgb 10 "cd/cd/cd"
    print_osc_rgb 11 "14/14/15"
    print_osc_rgb 12 "cd/cd/cd"
    print_osc_rgb 17 "87/87/87"
    print_osc_rgb 19 "cd/cd/cd"
}

do_linux() {
    print_linux 0 "#141415"
    print_linux 1 "#df6882"
    print_linux 2 "#8cb66d"
    print_linux 3 "#f3be7c"
    print_linux 4 "#7e98e8"
    print_linux 5 "#c3c3d5"
    print_linux 6 "#9bb4bc"
    print_linux 7 "#cdcdcd"
    print_linux 8 "#878787"
    print_linux 9 "#df6882"
    print_linux 10 "#8cb66d"
    print_linux 11 "#f3be7c"
    print_linux 12 "#7e98e8"
    print_linux 13 "#c3c3d5"
    print_linux 14 "#9bb4bc"
    print_linux 15 "#cdcdcd"
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
