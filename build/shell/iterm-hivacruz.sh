#!/usr/bin/env bash

# Source:   iterm
# Theme:    Hivacruz
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
    print_osc4 0 "20/27/46"
    print_osc4 1 "c9/49/22"
    print_osc4 2 "ac/97/39"
    print_osc4 3 "c0/8b/30"
    print_osc4 4 "3d/8f/d1"
    print_osc4 5 "66/79/cc"
    print_osc4 6 "22/a2/c9"
    print_osc4 7 "97/9d/b4"
    print_osc4 8 "6b/73/94"
    print_osc4 9 "c7/6b/29"
    print_osc4 10 "73/ad/43"
    print_osc4 11 "5e/66/87"
    print_osc4 12 "89/8e/a4"
    print_osc4 13 "df/e2/f1"
    print_osc4 14 "9c/63/7a"
    print_osc4 15 "f5/f7/ff"

    print_osc_rgb 10 "ed/e4/e4"
    print_osc_rgb 11 "13/26/38"
    print_osc_rgb 12 "97/9d/b4"
    print_osc_rgb 17 "5e/66/87"
    print_osc_rgb 19 "97/9d/b4"
}

do_linux() {
    print_linux 0 "#202746"
    print_linux 1 "#c94922"
    print_linux 2 "#ac9739"
    print_linux 3 "#c08b30"
    print_linux 4 "#3d8fd1"
    print_linux 5 "#6679cc"
    print_linux 6 "#22a2c9"
    print_linux 7 "#ede4e4"
    print_linux 8 "#6b7394"
    print_linux 9 "#c76b29"
    print_linux 10 "#73ad43"
    print_linux 11 "#5e6687"
    print_linux 12 "#898ea4"
    print_linux 13 "#dfe2f1"
    print_linux 14 "#9c637a"
    print_linux 15 "#f5f7ff"
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
