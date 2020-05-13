def ide-mode %{
    rename-client main
    set global jumpclient main

    evaluate-commands %sh{
        if [ -n "$TMUX" ]; then
            tmux split-window -v kak -c ${kak_session} -e 'rename-client tools
            set global toolsclient tools'
            tmux split-window -h -b kak -c ${kak_session} -e 'rename-client docs
            set global docsclient docs'
            echo 'nop'
        else
            echo '
                new rename-client tools
                set global toolsclient tools

                new rename-client docs
                set global docsclient docs
            '
        fi
    }

    # Using hidden functions, probably not a good idea
    kaktree--display

    try %(focus %opt(jumpclient))
} -docstring 'ide-mode:
Opens documentation, tool and file browser clients.'

def editor-mode %{
    rename-client main
    set global jumpclient main

    try %(evaluate-commands -client %opt(toolsclient) quit!)
    try %(evaluate-commands -client %opt(docsclient) quit!)
    try %(evaluate-commands -client %opt(kaktreeclient) quit!)

    focus %opt(jumpclient)
} -docstring 'editor-mode:
Closes documentation, tool, and file browser if they exist. This is the default mode of operation.'

def write-all-kill %{
    write-all
    kill
} -docstring 'write-all-kill:
Writes all changed buffers associated to a file, kills all clients and the server.'

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
} -docstring 'update-kide:
Updates kIDE and all the plugins.'

def kide-enable-theme %{
    source "%val{config}/theme/%arg{1}.kak"
} -params 1 -docstring 'kide-enable-theme <theme-name>:
Enables a theme.'

def update-kide-internal %{
    plug-install
    plug-update
    quit!
} -hidden

def setup-kide %{
    update-kide-internal
    quit!
} -hidden

def configure-lsp %{
    lsp-enable-window
    map global user l ':eum lsp<ret>' -docstring 'Enables LSP mode.'
} -hidden

def source-folder %{
    evaluate-commands %sh{
        for f in "$kak_config/$1"/*.kak; do
            if [ -f "$f" ]; then
                echo "source $f"
            fi
        done
    }
} -hidden -params 1

