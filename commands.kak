def ide %{
    rename-client main
    set global jumpclient main

    new rename-client tools
    set global toolsclient tools

    new rename-client docs
    set global docsclient docs
} -docstring 'Creates an IDE-like environment.'

def write-all-kill %{
    write-all
    kill
} -docstring 'Writes all changed buffers associated to a file, kills all clients and the server.'

def install-once %{
    plug-install
    quit!
} -hidden

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
    plug-update
    plug-install
    quit!
} -hidden
