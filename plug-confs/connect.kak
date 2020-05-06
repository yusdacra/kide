plug "alexherbo2/prelude.kak"
plug "alexherbo2/connect.kak" config %{
    set-option global connect_environment %{
      GIT_EDITOR='kak -c %val{session}'
    }
}
