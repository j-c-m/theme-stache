#!/usr/bin/env bash

# Source:   iterm
# Theme:    RetroLegends
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
    print_osc4 0 "26/26/26"
    print_osc4 1 "de/54/54"
    print_osc4 2 "45/eb/45"
    print_osc4 3 "f7/bf/2b"
    print_osc4 4 "40/66/f2"
    print_osc4 5 "bf/4c/f2"
    print_osc4 6 "40/d9/e6"
    print_osc4 7 "bf/e6/bf"
    print_osc4 8 "4c/59/4c"
    print_osc4 9 "ff/66/66"
    print_osc4 10 "59/ff/59"
    print_osc4 11 "ff/d9/33"
    print_osc4 12 "4c/80/ff"
    print_osc4 13 "e6/66/ff"
    print_osc4 14 "59/e6/ff"
    print_osc4 15 "f2/ff/f2"

    print_osc_rgb 10 "45/eb/45"
    print_osc_rgb 11 "0d/0d/0d"
    print_osc_rgb 12 "45/eb/45"
    print_osc_rgb 17 "33/66/33"
    print_osc_rgb 19 "f2/ff/f2"
}

do_linux() {
    print_linux 0 "#262626"
    print_linux 1 "#de5454"
    print_linux 2 "#45eb45"
    print_linux 3 "#f7bf2b"
    print_linux 4 "#4066f2"
    print_linux 5 "#bf4cf2"
    print_linux 6 "#40d9e6"
    print_linux 7 "#45eb45"
    print_linux 8 "#4c594c"
    print_linux 9 "#ff6666"
    print_linux 10 "#59ff59"
    print_linux 11 "#ffd933"
    print_linux 12 "#4c80ff"
    print_linux 13 "#e666ff"
    print_linux 14 "#59e6ff"
    print_linux 15 "#f2fff2"
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
