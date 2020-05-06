plug "andreyorst/smarttab.kak" defer smarttab %{
  # when `backspace' is pressed, 4 spaces are deleted at once
  set-option global softtabstop 4
} config %{
  # these languages will use `expandtab' behavior
  hook global WinSetOption filetype=(rust|markdown|kak|lisp|scheme|sh|perl) expandtab
  # these languages will use `noexpandtab' behavior
  hook global WinSetOption filetype=(makefile|gas) noexpandtab
  # these languages will use `smarttab' behavior
  hook global WinSetOption filetype=(c|cpp) smarttab
}
