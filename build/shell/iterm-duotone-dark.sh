#!/usr/bin/env bash

# Source:   iterm
# Theme:    Duotone Dark
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
    print_osc4 0 "1f/1d/27"
    print_osc4 1 "d9/39/3e"
    print_osc4 2 "2d/cd/73"
    print_osc4 3 "d9/b7/6e"
    print_osc4 4 "ff/c2/84"
    print_osc4 5 "de/8d/40"
    print_osc4 6 "24/88/ff"
    print_osc4 7 "b7/a1/ff"
    print_osc4 8 "35/31/47"
    print_osc4 9 "d9/39/3e"
    print_osc4 10 "2d/cd/73"
    print_osc4 11 "d9/b7/6e"
    print_osc4 12 "ff/c2/84"
    print_osc4 13 "de/8d/40"
    print_osc4 14 "24/88/ff"
    print_osc4 15 "ea/e5/ff"

    print_osc_rgb 10 "b7/a1/ff"
    print_osc_rgb 11 "1f/1d/27"
    print_osc_rgb 12 "ff/98/39"
    print_osc_rgb 17 "35/31/47"
    print_osc_rgb 19 "b7/a2/ff"
}

do_linux() {
    print_linux 0 "#1f1d27"
    print_linux 1 "#d9393e"
    print_linux 2 "#2dcd73"
    print_linux 3 "#d9b76e"
    print_linux 4 "#ffc284"
    print_linux 5 "#de8d40"
    print_linux 6 "#2488ff"
    print_linux 7 "#b7a1ff"
    print_linux 8 "#353147"
    print_linux 9 "#d9393e"
    print_linux 10 "#2dcd73"
    print_linux 11 "#d9b76e"
    print_linux 12 "#ffc284"
    print_linux 13 "#de8d40"
    print_linux 14 "#2488ff"
    print_linux 15 "#eae5ff"
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
