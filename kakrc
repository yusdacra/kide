source "%val{config}/plugin/plug.kak/rc/plug.kak"
source "%val{config}/plugins.kak"
source "%val{config}/options.kak"
source "%val{config}/commands.kak"
source "%val{config}/aliases.kak"
source "%val{config}/mappings.kak"
source-folder 'language'
kide-enable-theme 'default'
rename-client main
set global jumpclient main

# Try sourcing "user" kakrc
try %{ source "%val{config}/user/kakrc" }
# Try sourcing local (in working directory) kakrc
try %{ source .kakrc.local }
