# Requirements:
# - cargo and rustup
# - rust-analyzer or rls (it is highly recommended that you use rust-analyzer, you will get inlay hints and semantic highlighting)
# - rustfmt

hook global WinSetOption filetype=rust %{
    configure-lsp

    set window formatcmd rustfmt
    set window makecmd cargo

    # Enable inlay hints
    hook window -group rust-inlay-hints BufReload .* rust-analyzer-inlay-hints
    hook window -group rust-inlay-hints NormalIdle .* rust-analyzer-inlay-hints
    hook window -group rust-inlay-hints InsertIdle .* rust-analyzer-inlay-hints
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window rust-inlay-hints
    }

    # Enable semantic highlighting
    hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
    hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
    hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
    hook -once -always window WinSetOption filetype=.* %{
        remove-hooks window semantic-tokens
    }

    def -params 1.. cargo %{
        connect-terminal "cargo %arg{@}; read -n 1"
    } \
    -docstring "cargo [<arguments>]: 'cargo' wrapper"

    def -params 1.. rustup %{
        connect-terminal "rustup %arg{@}; read -n 1"
    } \
    -docstring "rustup [<arguments>]: 'rustup' wrapper"

    def -params 1.. cargo-bg %{
        nop %sh{ cargo %arg{@} }
    } \
    -docstring "cargo-bg [<arguments>]: 'cargo' wrapper.
    Runs in background."

    def -params 1.. rustup-bg %{
        nop %sh{ rustup %arg{@} }
    } \
    -docstring "rustup [<arguments>]: 'rustup' wrapper.
    Runs in background."
}
