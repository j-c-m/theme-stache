#!/usr/bin/env bash

# Source:   iterm
# Theme:    Adventure
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
    print_osc4 0 "04/04/04"
    print_osc4 1 "d8/4a/33"
    print_osc4 2 "5d/a6/02"
    print_osc4 3 "ee/bb/6e"
    print_osc4 4 "41/7a/b3"
    print_osc4 5 "e5/c4/99"
    print_osc4 6 "bd/cf/e5"
    print_osc4 7 "db/de/d8"
    print_osc4 8 "68/56/56"
    print_osc4 9 "d7/6b/42"
    print_osc4 10 "99/b5/2c"
    print_osc4 11 "ff/b6/70"
    print_osc4 12 "97/d7/ef"
    print_osc4 13 "aa/79/00"
    print_osc4 14 "bd/cf/e5"
    print_osc4 15 "e4/d5/c7"

    print_osc_rgb 10 "fe/ff/ff"
    print_osc_rgb 11 "04/04/04"
    print_osc_rgb 12 "fe/ff/ff"
    print_osc_rgb 17 "60/60/60"
    print_osc_rgb 19 "ff/ff/ff"
}

do_linux() {
    print_linux 0 "#040404"
    print_linux 1 "#d84a33"
    print_linux 2 "#5da602"
    print_linux 3 "#eebb6e"
    print_linux 4 "#417ab3"
    print_linux 5 "#e5c499"
    print_linux 6 "#bdcfe5"
    print_linux 7 "#feffff"
    print_linux 8 "#685656"
    print_linux 9 "#d76b42"
    print_linux 10 "#99b52c"
    print_linux 11 "#ffb670"
    print_linux 12 "#97d7ef"
    print_linux 13 "#aa7900"
    print_linux 14 "#bdcfe5"
    print_linux 15 "#e4d5c7"
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
