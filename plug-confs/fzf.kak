plug 'andreyorst/fzf.kak' config %{
    # fzf.kak plugin mappings
    map global user f ': fzf-mode<ret>' -docstring 'Enables fzf mode.'
} defer 'fzf' %{
    # fzf.kak plugin options
    set-option global fzf_highlight_command 'bat -p --color=always --theme=base16 {}'
    set-option global fzf_file_command 'rg -L --files --hidden'
    set-option global fzf_sk_grep_command 'rg -nSL'
}
