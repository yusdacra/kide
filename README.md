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
- `gdb` or one of the alternatives, `socat`, `perl`
- `universal-ctags`
- Clipboard support:
    - Wayland: `wl-clipboard`
    - X11: `xsel` or `xclip`
    - Mac: `pbcopy` and `pbpaste`

## Installation
Run `git clone --depth=1 --recursive https://gitlab.com/yusdacra/kide.git ~/.config/kak && kak -ui dummy -e setup-kide`.

## Configuration
Create and edit the file `~/.config/kak/user/kakrc`.
- add `source "%val{config}/language/name"` to enable a language
- add `set-option global kide_theme name` to enable a theme
- refer to a plugin's repository for more configuration (every configuration should apply)
- you can add plugins here (refer to plug.kak)

You can create `.kakrc.local` in a folder for project / folder specific settings. Same rules as `user/kakrc` apply.
