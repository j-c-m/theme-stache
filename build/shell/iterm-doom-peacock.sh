#!/usr/bin/env bash

# Source:   iterm
# Theme:    Doom Peacock
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
    print_osc4 0 "1c/1f/24"
    print_osc4 1 "cb/4b/16"
    print_osc4 2 "26/a6/a6"
    print_osc4 3 "bc/d4/2a"
    print_osc4 4 "2a/6c/c6"
    print_osc4 5 "a9/a1/e1"
    print_osc4 6 "56/99/af"
    print_osc4 7 "ed/e0/ce"
    print_osc4 8 "2b/2a/27"
    print_osc4 9 "ff/5d/38"
    print_osc4 10 "98/be/65"
    print_osc4 11 "e6/f9/72"
    print_osc4 12 "51/af/ef"
    print_osc4 13 "c6/78/dd"
    print_osc4 14 "46/d9/ff"
    print_osc4 15 "df/df/df"

    print_osc_rgb 10 "ed/e0/ce"
    print_osc_rgb 11 "2b/2a/27"
    print_osc_rgb 12 "9c/9c/9d"
    print_osc_rgb 17 "a6/00/33"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#1c1f24"
    print_linux 1 "#cb4b16"
    print_linux 2 "#26a6a6"
    print_linux 3 "#bcd42a"
    print_linux 4 "#2a6cc6"
    print_linux 5 "#a9a1e1"
    print_linux 6 "#5699af"
    print_linux 7 "#ede0ce"
    print_linux 8 "#2b2a27"
    print_linux 9 "#ff5d38"
    print_linux 10 "#98be65"
    print_linux 11 "#e6f972"
    print_linux 12 "#51afef"
    print_linux 13 "#c678dd"
    print_linux 14 "#46d9ff"
    print_linux 15 "#dfdfdf"
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
