def write-all-kill %{
    write-all
    kill
} -docstring 'Writes all changed buffers associated to a file, kills all clients and the server.'

def update-kide %{
    connect-terminal sh -c \
    'fail () {
        >&2 printf "%s\n" "$1"
        exit 1
    }
    git -C "$HOME/.config/kak/" pull || fail "Update failed, could not git pull."
    kak -ui dummy -e update-kide-internal || fail "Update failed, could not update plugins."
    printf "Update complete."
    read -n 1'
} -docstring 'Updates kide.'

def update-kide-internal %{
    plug-install
    plug-update
    quit!
} -hidden

def enable-lsp %{
    lsp-enable-window
    map global user l ':eum lsp<ret>' -docstring 'Enables LSP mode.'
} -hidden

# Set of mappings to copy/paste data to/from the system clipboard
define-command -hidden cb-copy %{
    execute-keys <a-|> %sh{
        if command -v xsel >/dev/null; then
            printf 'xsel -ib'
        elif command -v xclip >/dev/null; then
            printf 'xclip -i'
        elif command -v pbcopy >/dev/null; then
            printf 'pbcopy'
        fi
    } <ret>
}
define-command -hidden cb-paste-before %{
    execute-keys ! %sh{
        if command -v xsel >/dev/null; then
            printf 'xsel -ob'
        elif command -v xclip >/dev/null; then
            printf 'xclip -o'
        elif command -v pbcopy >/dev/null; then
            printf 'pbpaste'
        fi
    } <ret>
}
define-command -hidden cb-paste-after %{
    execute-keys <a-!> %sh{
        if command -v xsel >/dev/null; then
            printf 'xsel -ob'
        elif command -v xclip >/dev/null; then
            printf 'xclip -o'
        elif command -v pbcopy >/dev/null; then
            printf 'pbpaste'
        fi
    } <ret>
}
