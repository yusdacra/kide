plug "andreyorst/kaktree" config %{
  hook global WinSetOption filetype=kaktree %{
    remove-highlighter buffer/numbers
    remove-highlighter buffer/matching
    remove-highlighter buffer/wrap
    remove-highlighter buffer/show-whitespaces
  }
  kaktree-enable
  map global user t ':kaktree-toggle<ret>' -docstring 'Toggles kaktree.'
}
