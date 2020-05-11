source "%val{config}/color/selenized-black.kak"

# Enable relative line numbering
hook global WinCreate ^[^*]+$ %{ add-highlighter window/ number-lines -relative }
# Change status line text
set-option global modelinefmt '{{mode_info}} in {magenta}%val{client}{default} at {yellow}%val{session}{default} on {green}%val{bufname}{default} {{context_info}} {cyan}%val{cursor_line}{default}:{cyan}%val{cursor_char_column}{default}'
