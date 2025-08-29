#!/usr/bin/env bash

# Source:   iterm
# Theme:    DotGov
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
    print_osc4 0 "19/19/19"
    print_osc4 1 "bf/09/1d"
    print_osc4 2 "3d/97/51"
    print_osc4 3 "f6/bb/34"
    print_osc4 4 "17/b2/e0"
    print_osc4 5 "78/30/b0"
    print_osc4 6 "8b/d2/ed"
    print_osc4 7 "ff/ff/ff"
    print_osc4 8 "19/19/19"
    print_osc4 9 "bf/09/1d"
    print_osc4 10 "3d/97/51"
    print_osc4 11 "f6/bb/34"
    print_osc4 12 "17/b2/e0"
    print_osc4 13 "78/30/b0"
    print_osc4 14 "8b/d2/ed"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "eb/eb/eb"
    print_osc_rgb 11 "26/2c/35"
    print_osc_rgb 12 "d9/00/2f"
    print_osc_rgb 17 "1a/40/80"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#191919"
    print_linux 1 "#bf091d"
    print_linux 2 "#3d9751"
    print_linux 3 "#f6bb34"
    print_linux 4 "#17b2e0"
    print_linux 5 "#7830b0"
    print_linux 6 "#8bd2ed"
    print_linux 7 "#ebebeb"
    print_linux 8 "#191919"
    print_linux 9 "#bf091d"
    print_linux 10 "#3d9751"
    print_linux 11 "#f6bb34"
    print_linux 12 "#17b2e0"
    print_linux 13 "#7830b0"
    print_linux 14 "#8bd2ed"
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
