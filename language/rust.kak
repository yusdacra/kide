hook global WinSetOption filetype=rust %{
    lsp-enable-window
    map global user l ':eum lsp<ret>' -docstring 'Enables LSP mode.'
}

def -params 1.. cargo %{
    connect-terminal sh -c "cargo %arg{@}; read -n 1"
} \
-docstring \
"cargo [<arguments>]: 'cargo' wrapper"

def -params 1.. cargo-bg %{
    nop %sh{ cargo %arg{@} }
} \
-docstring \
"cargo-bg [<arguments>]: 'cargo' wrapper.
Runs in background."

def cargo-fmt %{
    nop %sh{cargo fmt}
} \
-docstring \
"format: Runs 'cargo fmt' on project."

def cargo-clean %{
    nop %sh{cargo clean}
} \
-docstring \
"format: Runs 'cargo clean' on project."
