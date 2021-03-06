# Editor options
set-option global autoreload yes
set-option global scrolloff 3,5
set-option global tabstop 4
set-option global indentwidth 4
set-option global grepcmd 'rg -Hn'

# Format on write
hook global BufWritePre .* %(try %(format));
