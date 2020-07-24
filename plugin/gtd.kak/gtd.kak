declare-option bool gtd

hook global WinSetOption gtd=true %{
    require-module gtd
    evaluate-commands set-option window static_words %opt{gtd_keywords}
    add-highlighter window/ ref gtd

    alias window gtd gtd-grep-todo

    map window normal <a-d> ': gtd-jump-to-day<ret>'
    map window normal <c-d> ': gtd-todo-done<ret>'
    map window insert <c-y> '<a-;>: gtd-insert-date<ret>'
    map window insert <c-u> '<a-;>: gtd-insert-time<ret>'

    hook -always -once window WinSetOption gtd=false %{
        remove-highlighter window/gtd
    }
}

provide-module gtd %{
    define-command gtd-replace-with %{
        execute-keys -draft '<a-x>s%arg{1}<ret>c%arg{2}<esc>'
    } -hidden -params 1..2
    
    declare-option -hidden str-list gtd_keywords 'To do' 'Done' 'Recurring' 'Idea' 'Cancelled'

    add-highlighter shared/gtd regions
    add-highlighter shared/gtd/code default-region group

    add-highlighter shared/gtd/code/time regex '\d{2}[:\.]\d{2}' 0:attribute
    add-highlighter shared/gtd/code/date regex '\d{4}.\d{2}.\d{2}' 0:attribute
    evaluate-commands %sh{
        # Keywords
        eval "set -- $kak_quoted_opt_gtd_keywords"
        keyword_regex="\\b(?:\\Q$1\\E"
        shift
        for keyword do
            keyword_regex="$keyword_regex|\\Q$keyword\\E"
        done
        keyword_regex="$keyword_regex)\\b"
        printf "add-highlighter shared/gtd/code/keywords regex '%s' 0:keyword\n" "$keyword_regex"
    }
    add-highlighter shared/gtd/code/dates regex '^# \d{4}.\d{2}.\d{2} \w+$' 0:module

    define-command gtd-jump-today %{
        set-register / "^# %sh(date '+%Y.%m.%d') \w+$"
        execute-keys '<space>n'
    }

    define-command gtd-todo-done %{gtd-replace-with 'To do' 'Done'}

    define-command gtd-grep-todo %(grep 'To do' %val(buffile))

    define-command gtd-insert-date %(execute-keys -draft '!date "+# %F %A"<ret>')
    define-command gtd-insert-time %(execute-keys -draft '!date "+%R" | tr -d "\n"<ret>')
}
