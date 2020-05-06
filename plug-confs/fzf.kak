plug "andreyorst/fzf.kak" config %{
  map global user f ':fzf-mode<ret>' -docstring 'Enables fzf mode.'
} defer "fzf" %{
  set-option global fzf_highlight_command 'bat -p'
  set-option global fzf_file_command 'rg -L --files --hidden'
  set-option global fzf_sk_grep_command "rg -nSL"
}
