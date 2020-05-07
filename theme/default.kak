colorscheme tomorrow-night

# Enable relative line numbering
hook global WinCreate ^[^*]+$ %{ add-highlighter window/ number-lines -relative }
# Change status line text
set-option global modelinefmt '{{mode_info}} {magenta}%val{client}{default} at {yellow}%val{session}{default} on {green}%val{bufname}{default} {{context_info}} {cyan}%val{cursor_line}{default}:{cyan}%val{cursor_char_column}{default}'
# powerline.kak settings
set-option global powerline_format 'git bufname filetype mode_info line_column position'
powerline-toggle line_column off
powerline-theme tomorrow-night
