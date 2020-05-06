hook global NormalKey y|d|c %{ nop %sh{
  if [ -n $TMUX ]; then
    tmux set-buffer -- "$kak_main_reg_dquote"
  else
		printf %s "$kak_main_reg_dquote" | xsel --input --clipboard
	fi
}}

