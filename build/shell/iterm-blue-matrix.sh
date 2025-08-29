#!/usr/bin/env bash

# Source:   iterm
# Theme:    Blue Matrix
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
    print_osc4 0 "10/11/16"
    print_osc4 1 "ff/56/80"
    print_osc4 2 "00/ff/9c"
    print_osc4 3 "ff/fc/58"
    print_osc4 4 "00/b0/ff"
    print_osc4 5 "d5/7b/ff"
    print_osc4 6 "76/c1/ff"
    print_osc4 7 "c7/c7/c7"
    print_osc4 8 "68/68/68"
    print_osc4 9 "ff/6e/67"
    print_osc4 10 "5f/fa/68"
    print_osc4 11 "ff/fc/67"
    print_osc4 12 "68/71/ff"
    print_osc4 13 "d6/82/ec"
    print_osc4 14 "60/fd/ff"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "00/a2/ff"
    print_osc_rgb 11 "10/11/16"
    print_osc_rgb 12 "76/ff/9f"
    print_osc_rgb 17 "c1/de/ff"
    print_osc_rgb 19 "00/00/00"
}

do_linux() {
    print_linux 0 "#101116"
    print_linux 1 "#ff5680"
    print_linux 2 "#00ff9c"
    print_linux 3 "#fffc58"
    print_linux 4 "#00b0ff"
    print_linux 5 "#d57bff"
    print_linux 6 "#76c1ff"
    print_linux 7 "#00a2ff"
    print_linux 8 "#686868"
    print_linux 9 "#ff6e67"
    print_linux 10 "#5ffa68"
    print_linux 11 "#fffc67"
    print_linux 12 "#6871ff"
    print_linux 13 "#d682ec"
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
