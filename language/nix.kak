# You need nixfmt and nix itself (duh).
# `rnix-lsp` is used as LSP server if you have it installed.

hook global WinSetOption filetype=nix %{
    configure-lsp
    
    set window formatcmd nixfmt
    set window makecmd nix
    set window tabstop 2
    set window softtabstop 2
    set window indentwidth 2
}
