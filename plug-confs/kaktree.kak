plug 'andreyorst/kaktree' config %{
    # kaktree plugin hooks
    hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
    }
    
    # kaktree plugin mappings
    map global user t ':kaktree-toggle<ret>' -docstring 'Toggles kaktree.'

    kaktree-enable
}
