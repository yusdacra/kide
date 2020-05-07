plug 'alexherbo2/move-line.kak' config %{
    # move-line.kak plugin mappings
    # Select and move with Ctrl+Alt
    map global normal <c-a-down> ': move-line-below<ret>'
    map global normal <c-a-up>   ': move-line-above<ret>'
    map global insert <c-a-down> '<a-;>: move-line-below<ret>'
    map global insert <c-a-up>   '<a-;>: move-line-above<ret>'
}
