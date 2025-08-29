#!/usr/bin/env bash

# Source:   iterm
# Theme:    Material
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
    print_osc4 0 "21/21/21"
    print_osc4 1 "b7/14/1f"
    print_osc4 2 "45/7b/24"
    print_osc4 3 "f6/98/1e"
    print_osc4 4 "13/4e/b2"
    print_osc4 5 "56/00/88"
    print_osc4 6 "0e/71/7c"
    print_osc4 7 "ef/ef/ef"
    print_osc4 8 "42/42/42"
    print_osc4 9 "e8/3b/3f"
    print_osc4 10 "7a/ba/3a"
    print_osc4 11 "ff/ea/2e"
    print_osc4 12 "54/a4/f3"
    print_osc4 13 "aa/4d/bc"
    print_osc4 14 "26/bb/d1"
    print_osc4 15 "d9/d9/d9"

    print_osc_rgb 10 "23/23/22"
    print_osc_rgb 11 "ea/ea/ea"
    print_osc_rgb 12 "16/af/ca"
    print_osc_rgb 17 "c2/c2/c2"
    print_osc_rgb 19 "4e/4e/4e"
}

do_linux() {
    print_linux 0 "#212121"
    print_linux 1 "#b7141f"
    print_linux 2 "#457b24"
    print_linux 3 "#f6981e"
    print_linux 4 "#134eb2"
    print_linux 5 "#560088"
    print_linux 6 "#0e717c"
    print_linux 7 "#232322"
    print_linux 8 "#424242"
    print_linux 9 "#e83b3f"
    print_linux 10 "#7aba3a"
    print_linux 11 "#ffea2e"
    print_linux 12 "#54a4f3"
    print_linux 13 "#aa4dbc"
    print_linux 14 "#26bbd1"
    print_linux 15 "#d9d9d9"
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
