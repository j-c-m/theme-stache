#!/usr/bin/env bash

# Source:   iterm
# Theme:    0x96f
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
    print_osc4 0 "26/24/27"
    print_osc4 1 "ff/66/6d"
    print_osc4 2 "b3/e0/3a"
    print_osc4 3 "ff/c7/39"
    print_osc4 4 "00/cd/e8"
    print_osc4 5 "a3/92/e8"
    print_osc4 6 "9d/ea/f6"
    print_osc4 7 "fc/fc/fa"
    print_osc4 8 "54/54/52"
    print_osc4 9 "ff/7e/83"
    print_osc4 10 "be/e5/5e"
    print_osc4 11 "ff/d0/5e"
    print_osc4 12 "1b/d5/eb"
    print_osc4 13 "b0/a3/eb"
    print_osc4 14 "ac/ed/f8"
    print_osc4 15 "fc/fc/fa"

    print_osc_rgb 10 "fc/fc/fa"
    print_osc_rgb 11 "26/24/27"
    print_osc_rgb 12 "fc/fc/fa"
    print_osc_rgb 17 "fc/fc/fa"
    print_osc_rgb 19 "26/24/27"
}

do_linux() {
    print_linux 0 "#262427"
    print_linux 1 "#ff666d"
    print_linux 2 "#b3e03a"
    print_linux 3 "#ffc739"
    print_linux 4 "#00cde8"
    print_linux 5 "#a392e8"
    print_linux 6 "#9deaf6"
    print_linux 7 "#fcfcfa"
    print_linux 8 "#545452"
    print_linux 9 "#ff7e83"
    print_linux 10 "#bee55e"
    print_linux 11 "#ffd05e"
    print_linux 12 "#1bd5eb"
    print_linux 13 "#b0a3eb"
    print_linux 14 "#acedf8"
    print_linux 15 "#fcfcfa"
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
