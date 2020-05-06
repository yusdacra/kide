#!/bin/bash

KAK_CONF_DIR="$HOME/.config/kak"

println () {
  printf "%s\n" "$1"
}

printerr () {
  >&2 println "$1"
}

check_cmd () {
  retval=1
	if ! [ -x "$(command -v "$1")" ]; then
  	printerr "Error: $1 is not installed."
  	retval=0
	fi
	return "$retval"
}

fail () {
  printerr "$1"
  exit 1
}

check_deps () {
  dependencies=( "git" "kak" "fzf" "cargo" "bat" "rg" "xsel" )
  dep_is_missing=""

  for dep in "${dependencies[@]}"; do
        dep_is_missing=$(check_cmd "$dep")
  done

  if [ "$dep_is_missing" = "0" ]; then
    printerr "Missing dependencies."
    exit 1
  fi
}

prepare () {
  if [ -d "$KAK_CONF_DIR" ]; then
  	mv "$KAK_CONF_DIR" "$KAK_CONF_DIR-backup"
  fi

  mkdir -p "$KAK_CONF_DIR" || fail "couldn't create kakoune config directory"
}

install () {
  println "Installing ..."
  git clone --depth 1 https://gitlab.com/yusdacra/kide "$KAK_CONF_DIR" || fail "couldn't clone kide"

  println "Installing plug.kak..."
  git clone --depth 1 https://gitlab.com/andreyorst/plug.kak "$KAK_CONF_DIR/plug.kak" || fail "couldn't clone plug.kak"
  mkdir "$KAK_CONF_DIR/plugins"

  println "Initial setup"
  println "Installing default plugins..."
  kak -ui dummy -e install-once
}

println "Checking dependencies..."
check_deps
println "Preparing to install kide..."
prepare
println "Installing kide..."
install
println "Installation complete! Happy coding!"
