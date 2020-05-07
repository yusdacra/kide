# kIDE (**k**akoune **I**ntegrated **D**evelopment **E**nvironment)
`kIDE` is a (opinionated) `kakoune` configuration to give the user the IDE feel.
WIP, although usable.

## Features
Language configuration files has requirements listed on top of the file.
- Supported languages:
    - Rust
    - bash

## Requirements
- `kakoune` built from master branch (not everything might work with stable)
- `ripgrep`
- `bat`
- `cargo`
- `git`
- `xsel`
- `fzf`

Currently, only Linux distributions using Xorg are supported.

## Installation
Run `curl -L "http://nazr.in/1dTE" > ~/install-kide && sh ~/install-kide`.

([nazr.in](http://nazr.in) is a cute little URL shortener.)

## Configuration
Create and edit the file `~/.config/kak/user/kakrc`.
- add `source "%val{config}/language/<language-name>"` to enable language support
