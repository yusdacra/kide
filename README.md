# kIDE (**k**akoune **I**ntegrated **D**evelopment **E**nvironment)
`kIDE` is an opinionated `kakoune` configuration.
WIP, although usable.

## Requirements
- `kakoune` built from master branch (not everything might work with stable)
- `fzf`, `ripgrep`, `bat`
- `git`
- `cargo` (for LSP client)
- `gdb`, `socat`, `perl` (for gdb inside kakoune)
- `universal-ctags` (for ctags inside kakoune)
- Clipboard support:
    - Linux:
        - Wayland: `wl-clipboard`
        - X11: `xsel` or `xclip`
    - Mac: `pbcopy` and `pbpaste`
- Look into `language` folder for various languages that might need tools installed.

## Installation
Run `git clone --depth=1 --recursive https://gitlab.com/yusdacra/kide.git ~/.config/kak`.

## Configuration
Create and edit the file `~/.config/kak/user/kakrc`.
- add `kide-enable-theme name` to enable a theme (look for themes in `theme` folder)
- refer to a plugin's repository for more configuration (every configuration should apply)
- you can add plugins here (refer to plug.kak)

You can create `.kakrc.local` in a folder for project / folder specific configuration.
