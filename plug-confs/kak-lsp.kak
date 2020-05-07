plug 'ul/kak-lsp' do %{
    cargo install --locked --force --path .
} config %{
    eval %sh{kak-lsp --kakoune -s $kak_session}
}
