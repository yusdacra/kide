# kIDE (**k**akoune **I**ntegrated **D**evelopment **E**nvironment)
`kIDE` is an opinionated `kakoune` configuration to give the user the IDE feel.
WIP, although usable.

## Features
Language configuration files has requirements listed on top of the file.
- Supported languages:
    - Rust
    - bash

## Requirements
- `kakoune` built from master branch (not everything might work with stable)
- `fzf`, `ripgrep`, `bat`
- `git`
- `cargo`
- `gdb`, `socat`, `perl`
- `ctags`, `readtags`
- Clipboard support:
    - Wayland: `wl-clipboard`
    - X11: `xsel` or `xclip`
    - Mac: `pbcopy` and `pbpaste`

## Installation
Run `curl -L "http://nazr.in/1dTE" | sh`.

([nazr.in](http://nazr.in) is a cute little URL shortener.)

## Configuration
Create and edit the file `~/.config/kak/user/kakrc`.
- add `source "%val{config}/language/name"` to enable a language
- add `set-option global kide_theme name` to enable a theme
