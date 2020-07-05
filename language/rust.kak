# Requirements:
# - cargo and rustup
# - rust-analyzer or rls (it is highly recommended that you use rust-analyzer, you will get inlay hints and semantic highlighting)
# - rustfmt

hook global WinSetOption filetype=rust %{
    configure-lsp

    set window formatcmd rustfmt
    set window makecmd cargo

    try %{
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
    }
}
