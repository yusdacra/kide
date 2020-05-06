# UI options
set-option -add global ui_options ncurses_set_title=no
set-option global modelinefmt '{{mode_info}} {magenta}%val{client}{default} at {yellow}%val{session}{default} on {green}%val{bufname}{default} {{context_info}} {cyan}%val{cursor_line}{default}:{cyan}%val{cursor_char_column}{default}'

# Editor options
set-option global autoreload yes
set-option global scrolloff 3,5
set-option global tabstop 4
set-option global indentwidth 4
