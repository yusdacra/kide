# connect.kak dependency
plug 'alexherbo2/prelude.kak'
plug 'alexherbo2/connect.kak' config %{
    # connect.kak plugin options
    set-option global connect_environment %{
      GIT_EDITOR='kak -c %val{session}'
    }
}
