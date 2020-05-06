colorscheme default

# Enable line numbering
hook global WinCreate ^[^*]+$ %{ add-highlighter window/ number-lines }
