# You need nixfmt and nix itself (duh).

hook global WinSetOption filetype=nix %{
    set window formatcmd nixfmt
    set window makecmd nix
    set window tabstop 2
    set window softtabstop 2
    set window indentwidth 2
}
