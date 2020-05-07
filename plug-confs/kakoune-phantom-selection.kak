plug 'occivink/kakoune-phantom-selection' config %{
    # kakoune-phantom-selection plugin mappings (overrides "select to" mapping)
    map global normal f       ': phantom-selection-add-selection<ret>'
    map global normal <s-f>   ': phantom-selection-select-all; phantom-selection-clear<ret>'
    map global normal <a-f>   ': phantom-selection-iterate-next<ret>'
    map global normal <a-s-f> ': phantom-selection-iterate-prev<ret>'
    map global insert <a-f>   '<esc>: phantom-selection-iterate-next<ret>i'
    map global insert <a-s-f> '<esc>: phantom-selection-iterate-prev<ret>i'
}
