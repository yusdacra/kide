source "%val{config}/color/selenized-black.kak"

# Enable relative line numbering
hook global WinCreate ^[^*]+$ %{ add-highlighter window/ number-lines -relative }
# Change status line text
set-option global modelinefmt '{{mode_info}} in {green}%val{bufname}{default} {{context_info}} at {cyan}%val{cursor_line}{default}:{cyan}%val{cursor_char_column}{default} (client {magenta}%val{client}{default} on session {yellow}%val{session}{default})'
