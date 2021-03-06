plug 'robertmeta/plug.kak' noload config %{
    set-option global plug_install_dir "%val{config}/plugin"
    set-option global plug_always_ensure true
}

plug 'andreyorst/kaktree' config %{
    hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces

        set-option buffer modelinefmt ''
        
        map global user k ': focus %opt(kaktreeclient)<ret>' -docstring 'Focus the file manager window.'
        hook -once -always global WinClose filetype=kaktree %{
            unmap global user k
        }
    }
    hook global WinCreate .* kaktree-enable
}

plug 'andreyorst/smarttab.kak' config %{
    hook global WinSetOption filetype=(rust|markdown|kak|lisp|scheme|sh|perl|haskell|nix|yaml) expandtab
    hook global WinSetOption filetype=(makefile|gas|gd) noexpandtab
    hook global WinSetOption filetype=(c|cpp) smarttab
}

plug 'andreyorst/fzf.kak' defer 'fzf' %{
    set-option global fzf_highlight_command 'bat -p --color=always --theme=base16 {}'
    set-option global fzf_file_command 'rg -L --files --hidden'
    set-option global fzf_sk_grep_command 'rg -nSL'
} config %{
    map global user f ': fzf-mode<ret>' -docstring 'Enables fzf mode.'
}
###################################################################################
plug 'alexherbo2/prelude.kak'
plug 'alexherbo2/auto-pairs.kak'
plug 'alexherbo2/move-line.kak' config %{
    map global normal <c-a-down> ': move-line-below<ret>'
    map global normal <c-a-up>   ': move-line-above<ret>'
    map global insert <c-a-down> '<a-;>: move-line-below<ret>'
    map global insert <c-a-up>   '<a-;>: move-line-above<ret>'
}
###################################################################################
plug 'occivink/kakoune-phantom-selection' config %{
    # overrides "select to" mapping
    map global normal f       ': phantom-selection-add-selection<ret>'
    map global normal <s-f>   ': phantom-selection-select-all; phantom-selection-clear<ret>'
    map global normal <a-f>   ': phantom-selection-iterate-next<ret>'
    map global normal <a-s-f> ': phantom-selection-iterate-prev<ret>'
    map global insert <a-f>   '<esc>: phantom-selection-iterate-next<ret>i'
    map global insert <a-s-f> '<esc>: phantom-selection-iterate-prev<ret>i'
}

plug 'occivink/kakoune-gdb' config %{
    hook global GlobalSetOption gdb_started=true %{
        map global normal <F10>   ': gdb-next<ret>'
        map global normal <F11>   ': gdb-step<ret>'
        map global normal <s-F11> ': gdb-finish<ret>'
        map global normal <F9>    ': gdb-toggle-breakpoint<ret>'
        map global normal <F5>    ': gdb-continue<ret>'
    }
    hook global GlobalSetOption gdb_started=false %{
        unmap global normal <F10>   ': gdb-next<ret>'
        unmap global normal <F11>   ': gdb-step<ret>'
        unmap global normal <s-F11> ': gdb-finish<ret>'
        unmap global normal <F9>    ': gdb-toggle-breakpoint<ret>'
        unmap global normal <F5>    ': gdb-continue<ret>'
    }
}
###################################################################################
plug 'lePerdu/kakboard' config %{
    hook global WinCreate .* kakboard-enable
}
###################################################################################
plug 'ul/kak-lsp' do %{
    cargo install --locked --force --path .
}
###################################################################################
plug 'Skytrias/gdscript-kak'
###################################################################################
plug 'gtd.kak' load-path "%opt{plug_install_dir}/gtd.kak" config %{
    hook global BufCreate '.*.gtd' %{
        set-option buffer gtd yes
    }
}
