# Requirements:
# - shellcheck
# - bash-language-server (for bash LSP support, optional)
# 
# After you source this configuration, run `plug-install` to ensure the plugins are installed.

# Enables linting for shell scripts
plug 'Screwtapello/kakoune-shellcheck' domain 'gitlab.com'

hook global WinSetOption filetype=sh %{
    configure-lsp

    try %{
        def execute-script %{
            connect-terminal sh -c "$SHELL %val{buffile}; read -n 1"
        } -docstring %sh{echo "Executes the file currently open with $SHELL."}
    }
}
