plug 'andreyorst/smarttab.kak' defer smarttab %{
    # smarttab.kak plugin options
    set-option global softtabstop 4
} config %{
    # smarttab.kak plugin hooks
    hook global WinSetOption filetype=(rust|markdown|kak|lisp|scheme|sh|perl) expandtab
    hook global WinSetOption filetype=(makefile|gas) noexpandtab
    hook global WinSetOption filetype=(c|cpp) smarttab
}
