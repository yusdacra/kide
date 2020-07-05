# Requirements:
# - shellcheck
# - bash-language-server (for bash LSP support, optional)
# 
# After you source this configuration, run `plug-install` to ensure the plugins are installed.

# Enables linting for shell scripts
plug 'Screwtapello/kakoune-shellcheck' domain 'gitlab.com'

hook global WinSetOption filetype=sh %{
    configure-lsp
}
