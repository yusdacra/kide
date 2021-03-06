# If you don't like a mapping, unmap like this:
# `unmap global <mode> <mapped-keys>`

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

# <c-a-f> - Select
map global normal <c-a-f> 's'
map global insert <c-a-f> '<a-;>s'

# <c-s> - Write buffer to file
map global normal <c-s> ': w<ret>'
map global insert <c-s> '<a-;>: w<ret>'

# <c-w> - Close buffer
map global normal <c-w> ': db<ret>'
map global insert <c-w> '<a-;>: db<ret>'

# <c-q> - Close kakoune
map global normal <c-q> ': q<ret>'
map global insert <c-q> '<a-;>: q<ret>'

# <c-s-p> - Open prompt
map global normal <c-s-p> ':'
map global insert <c-s-p> '<a-;>:'

# <#> Comments lines
map global normal '#' ': comment-line<ret>'

# <up>/<down> for completion selection, <tab> for confirming, <ret> for cancelling
hook global InsertCompletionShow .* %{
    map window insert <ret>   '<c-o>'
    map window insert <s-tab> '<c-p>'
    map window insert <tab>   '<c-n>'
}

hook global InsertCompletionHide .* %{
    unmap window insert <ret>   '<c-o>'
    unmap window insert <s-tab> '<c-p>'
    unmap window insert <tab>   '<c-n>'
}

map global user s ': ide-mode<ret>' -docstring 'Switch to IDE mode.'
map global user m ': focus %opt(jumpclient)<ret>' -docstring 'Focus the main window.'
