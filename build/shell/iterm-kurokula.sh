#!/usr/bin/env bash

# Source:   iterm
# Theme:    kurokula
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
    print_osc4 0 "33/33/33"
    print_osc4 1 "c3/5a/52"
    print_osc4 2 "78/b3/a9"
    print_osc4 3 "e1/b9/17"
    print_osc4 4 "5c/91/dd"
    print_osc4 5 "8b/79/a6"
    print_osc4 6 "86/72/68"
    print_osc4 7 "e0/cf/c2"
    print_osc4 8 "51/51/51"
    print_osc4 9 "ff/c3/4c"
    print_osc4 10 "af/ff/a5"
    print_osc4 11 "ff/f7/00"
    print_osc4 12 "90/db/ff"
    print_osc4 13 "ad/93/ff"
    print_osc4 14 "ff/cd/b6"
    print_osc4 15 "ff/ff/ff"

    print_osc_rgb 10 "e0/cf/c2"
    print_osc_rgb 11 "14/15/15"
    print_osc_rgb 12 "7a/1c/1c"
    print_osc_rgb 17 "51/51/51"
    print_osc_rgb 19 "ff/c3/4c"
}

do_linux() {
    print_linux 0 "#333333"
    print_linux 1 "#c35a52"
    print_linux 2 "#78b3a9"
    print_linux 3 "#e1b917"
    print_linux 4 "#5c91dd"
    print_linux 5 "#8b79a6"
    print_linux 6 "#867268"
    print_linux 7 "#e0cfc2"
    print_linux 8 "#515151"
    print_linux 9 "#ffc34c"
    print_linux 10 "#afffa5"
    print_linux 11 "#fff700"
    print_linux 12 "#90dbff"
    print_linux 13 "#ad93ff"
    print_linux 14 "#ffcdb6"
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
