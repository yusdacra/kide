# kIDE (*k*akoune *I*ntegrated *D*evelopment *E*nvironment)
`kIDE` is a collection of configurations and sensible defaults wrapped neatly to give the user the IDE feel.

## Features
- Supported languages:
    - Rust

## Requirements
- `kak` stable version (duh)
- `rg` (ripgrep)
- `bat`
- `cargo`
- `git`
- `xsel`
- `fzf`

Currently, only Linux distributions using Xorg are supported.

## Installation
Run `curl "https://gitlab.com/yusdacra/kide/-/raw/master/install.sh?inline=false" > ~/install-kide.sh && bash ~/install-kide.sh`.

## Configuration
Create and edit the file `~/.config/kak/user/kakrc`.
- add `source "%val{config}/language/<language-name>"` to enable language support
