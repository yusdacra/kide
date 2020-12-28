# Requirements:
# - cargo and rustup
# - rust-analyzer or rls (it is highly recommended that you use rust-analyzer, you will get inlay hints and semantic highlighting)
# - rustfmt

hook global WinSetOption filetype=rust %{
    configure-lsp

    set window formatcmd rustfmt
    set window makecmd cargo

    # We use `try` in these two because the user might not have `rust-analyzer` (please use it, it's better)
    try %{
        # Enable inlay hints
        hook window -group rust-inlay-hints BufReload .* rust-analyzer-inlay-hints
        hook window -group rust-inlay-hints NormalIdle .* rust-analyzer-inlay-hints
        hook window -group rust-inlay-hints InsertIdle .* rust-analyzer-inlay-hints
        hook -once -always window WinSetOption filetype=.* %{
            remove-hooks window rust-inlay-hints
        }
    }

    try %{
        # Enable semantic highlighting
        hook window -group semantic-tokens BufReload .* lsp-semantic-tokens
        hook window -group semantic-tokens NormalIdle .* lsp-semantic-tokens
        hook window -group semantic-tokens InsertIdle .* lsp-semantic-tokens
        hook -once -always window WinSetOption filetype=.* %{
            remove-hooks window semantic-tokens
        }
    }

    lsp-inlay-diagnostics-enable global
    set-option global lsp_server_configuration rust-analyzer.cargo.loadOutDirsFromCheck="on"
    set-option global lsp_server_configuration rust-analyzer.procMacro.enable="on"

    # Add highlighting for Cargo utility when using `make` command
    add-highlighter shared/make/ regex "^(error)|(warning)" 1:red+b 2:yellow+b
    add-highlighter shared/make/ regex "^ *Updating|Vendoring|Compiling|Checking|Finished|Running " 0:green+b
}
