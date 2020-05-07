# If you don't like a mapping, unmap like this:
# `unmap global <mode> <mapped-keys>`

# Paste from system clipboard
map global normal <c-v> ': cb-paste-before<ret>'
map global normal <c-y> ': cb-paste-after<ret>'
map global insert <c-v> '<esc>: cb-paste-before<ret>i'
map global insert <c-y> '<esc>: cb-paste-after<ret>i'

# Copy / cut with Ctrl
map global normal <c-c> ': cb-copy<ret>'
map global normal <c-x> ': cb-copy<ret>'
map global insert <c-c> '<esc>: cb-copy<ret>i'
map global insert <c-x> '<esc>: cb-copy<ret>i'

# Indent the current selection with <tab>
map global insert <tab> '<a-;><gt>'
# De-indent the current selection with <s-tab>
map global insert <s-tab> '<a-;><lt>'

# Move with Ctrl
map global normal <c-left>  'b'
map global normal <c-right> 'w'
map global normal <c-up>    'k<a-x>'
map global normal <c-down>  'j<a-x>'
map global insert <c-left>  '<a-;>b'
map global insert <c-right> '<a-;>w'
map global insert <c-up>    '<a-;>k<a-;><a-x>'
map global insert <c-down>  '<a-;>j<a-;><a-x>'

# Move and select with Ctrl+Shift
map global normal <c-s-left>  '<s-b>'
map global normal <c-s-right> '<s-w>'
map global normal <c-s-up>    '<s-k><a-x>'
map global normal <c-s-down>  '<s-j><a-x>'
map global insert <c-s-left>  '<a-;><s-b>'
map global insert <c-s-right> '<a-;><s-w>'
map global insert <c-s-up>    '<a-;><s-k><a-;><a-x>'
map global insert <c-s-down>  '<a-;><s-j><a-;><a-x>'

# <c-f> - Search
map global normal <c-f> '/'
map global insert <c-f> '<a-;>/'

# <c-s-f> - Select
map global normal <c-s-f> 's'
map global insert <c-s-f> '<a-;>s'

# <c-s> - Write buffer to file
map global normal <c-s> ': w<ret>'
map global insert <c-s> '<a-;>: w<ret>'

# <c-w> - Close buffer
map global normal <c-w> ': db<ret>'
map global insert <c-w> '<a-;>: db<ret>'

# <c-p> - Open prompt
map global normal <c-p> ':'
map global insert <c-p> '<a-;>:'

# <#> Comments lines
map global normal '#' ': comment-line<ret>'

# <tab>/<s-tab> for completion selection
hook global InsertCompletionShow .* %{
    map window insert <tab>    '<c-n>'
    map window insert <s-tab>  '<c-p>'
    map window insert <esc>    '<c-o>'
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab>    '<c-n>'
    unmap window insert <s-tab>  '<c-p>'
    unmap window insert <esc>    '<c-o>'
}
