# Requirements:
# - cargo and rustup
# - rust-analyzer or rls
# - rustfmt

hook global WinSetOption filetype=rust %{
    configure-lsp

    set window formatcmd rustfmt
    set window makecmd cargo
    
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
