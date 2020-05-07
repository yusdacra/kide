#!/bin/bash

KAK_CONF_DIR="$HOME/.config/kak"

println () {
    printf "%s\n" "$1"
}

printerr () {
    >&2 println "$1"
}

check_cmd () {
    if ! [ -x "$(command -v "$1")" ]; then
        printerr "Error: $1 is not installed."
    fi
}

fail () {
    printerr "$1"
    exit 1
}


println "Checking dependencies..."
dependencies=( "git" "kak" "fzf" "cargo" "bat" "rg" "ctags" "readtags" "gdb" "socat" "perl" )
cb_deps_x11=( "xsel" "xclip" )
cb_deps_wayland=( "wl-copy" "wl-paste" )
cb_deps_mac=( "pbcopy" "pbpaste" )

for dep in "${dependencies[@]}"; do
    check_cmd "$dep"
done

uname_out="$(uname -s)"

if [ "$uname_out" = "Darwin" ]; then
    for dep in "${cb_deps_mac[@]}"; do
        check_cmd "$dep"
    done
elif [ "$uname_out" = "Linux" ]; then
    if [ "$XDG_SESSION_TYPE" = "x11" ]; then
        for dep in "${cb_deps_x11[@]}"; do
            check_cmd "$dep"
        done
        println "If you are just missing xsel or xclip, you are good to go!"
    elif [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        for dep in "${cb_deps_wayland[@]}"; do
            check_cmd "$dep"
        done
    else
        printerr "Unsupported session."
        exit 1
    fi
else
    printerr "Platform not supported."
    exit 1
fi

println "Preparing to install..."
if [ -d "$KAK_CONF_DIR" ]; then
    mv "$KAK_CONF_DIR" "$KAK_CONF_DIR-backup"
fi

mkdir -p "$KAK_CONF_DIR" || fail "couldn't create kakoune config directory"


println "Installing..."
println "Cloning kIDE..."
git clone --depth 1 https://gitlab.com/yusdacra/kide.git "$KAK_CONF_DIR" || fail "couldn't clone kIDE"

mkdir "$KAK_CONF_DIR/plugin"
println "Cloning plug.kak..."
git clone --depth 1 https://gitlab.com/andreyorst/plug.kak.git "$KAK_CONF_DIR/plugin/plug.kak" || fail "couldn't clone plug.kak"

println "Installing default plugins..."
kak -ui dummy -e update-kide-internal
println "Installation complete!"
