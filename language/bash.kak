# Requirements:
# - bash (duh)
# - shellcheck
# - bash-language-server
# 
# After you source this configuration, run `plug-install` to ensure the plugins are installed.

# Enables linting for shell scripts
source "%val{config}/plug-confs/kakoune-shellcheck.kak"

hook global WinSetOption filetype=sh %{
    enable-lsp
    
    def execute-script %{
        connect-terminal sh -c "bash %val{buffile}; read -n 1"
    } -docstring 'Executes the file currently open with bash.'
}
