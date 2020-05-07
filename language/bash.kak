# Requirements:
# - bash (duh)
# - shellcheck
# - bash-language-server
# 
# After you source this configuration, run `plug-install` to ensure the plugins are installed.

# Enables linting for shell scripts
plug 'Screwtapello/kakoune-shellcheck' domain 'gitlab.com'

hook global WinSetOption filetype=sh %{
    configure-lsp
    
    def execute-script %{
        connect-terminal sh -c "bash %val{buffile}; read -n 1"
    } -docstring 'Executes the file currently open with bash.'
}
