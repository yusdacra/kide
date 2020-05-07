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
    git -C "$HOME/.config/kak" pull || fail "Update failed, could not update kIDE."
    kak -ui dummy -e update-kide-internal || fail "Update failed, could not update plugins."
    printf "Update complete."
    read -n 1'
} -docstring 'Updates kide.'

def update-kide-internal %{
    plug-install
    plug-update
    quit!
} -hidden

def configure-lsp %{
    lsp-enable-window
    map global user l ':eum lsp<ret>' -docstring 'Enables LSP mode.'
} -hidden
