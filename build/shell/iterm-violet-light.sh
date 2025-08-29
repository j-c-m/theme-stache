#!/usr/bin/env bash

# Source:   iterm
# Theme:    Violet Light
# Author:   unknown
# Variant:  light

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
    print_osc4 0 "56/59/5c"
    print_osc4 1 "c9/4c/22"
    print_osc4 2 "85/98/1c"
    print_osc4 3 "b4/88/1d"
    print_osc4 4 "2e/8b/ce"
    print_osc4 5 "d1/3a/82"
    print_osc4 6 "32/a1/98"
    print_osc4 7 "d3/d0/c9"
    print_osc4 8 "45/48/4b"
    print_osc4 9 "bd/36/13"
    print_osc4 10 "73/8a/04"
    print_osc4 11 "a5/77/05"
    print_osc4 12 "21/76/c7"
    print_osc4 13 "c6/1c/6f"
    print_osc4 14 "25/92/86"
    print_osc4 15 "c9/c6/bd"

    print_osc_rgb 10 "53/68/70"
    print_osc_rgb 11 "fc/f4/dc"
    print_osc_rgb 12 "53/68/70"
    print_osc_rgb 17 "59/5a/b7"
    print_osc_rgb 19 "fc/f4/dc"
}

do_linux() {
    print_linux 0 "#56595c"
    print_linux 1 "#c94c22"
    print_linux 2 "#85981c"
    print_linux 3 "#b4881d"
    print_linux 4 "#2e8bce"
    print_linux 5 "#d13a82"
    print_linux 6 "#32a198"
    print_linux 7 "#536870"
    print_linux 8 "#45484b"
    print_linux 9 "#bd3613"
    print_linux 10 "#738a04"
    print_linux 11 "#a57705"
    print_linux 12 "#2176c7"
    print_linux 13 "#c61c6f"
    print_linux 14 "#259286"
    print_linux 15 "#c9c6bd"
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
