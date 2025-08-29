#!/usr/bin/env bash

# Source:   iterm
# Theme:    violite
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
    print_osc4 0 "24/1c/36"
    print_osc4 1 "ec/79/79"
    print_osc4 2 "79/ec/b3"
    print_osc4 3 "ec/e2/79"
    print_osc4 4 "a9/79/ec"
    print_osc4 5 "ec/79/ec"
    print_osc4 6 "79/ec/ec"
    print_osc4 7 "ee/f4/f6"
    print_osc4 8 "49/37/6d"
    print_osc4 9 "ef/8f/8f"
    print_osc4 10 "9f/ef/bf"
    print_osc4 11 "ef/e7/8f"
    print_osc4 12 "b7/8f/ef"
    print_osc4 13 "ef/8f/cf"
    print_osc4 14 "9f/ef/ef"
    print_osc4 15 "f8/fa/fc"

    print_osc_rgb 10 "ee/f4/f6"
    print_osc_rgb 11 "24/1c/36"
    print_osc_rgb 12 "ee/f4/f6"
    print_osc_rgb 17 "49/37/6d"
    print_osc_rgb 19 "ee/f4/f6"
}

do_linux() {
    print_linux 0 "#241c36"
    print_linux 1 "#ec7979"
    print_linux 2 "#79ecb3"
    print_linux 3 "#ece279"
    print_linux 4 "#a979ec"
    print_linux 5 "#ec79ec"
    print_linux 6 "#79ecec"
    print_linux 7 "#eef4f6"
    print_linux 8 "#49376d"
    print_linux 9 "#ef8f8f"
    print_linux 10 "#9fefbf"
    print_linux 11 "#efe78f"
    print_linux 12 "#b78fef"
    print_linux 13 "#ef8fcf"
    print_linux 14 "#9fefef"
    print_linux 15 "#f8fafc"
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
