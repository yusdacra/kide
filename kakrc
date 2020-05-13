source "%val{config}/plugin/plug.kak/rc/plug.kak"
source "%val{config}/commands.kak"
source "%val{config}/aliases.kak"
source "%val{config}/mappings.kak"
source "%val{config}/options.kak"
source "%val{config}/plugins.kak"
source-folder "plugin"
source-folder "language"
kide-enable-theme "default"

# Try loading "user" settings
try %{ source "%val{config}/user/kakrc" }
# Source a local project kak config if it exists
try %{ source .kakrc.local }
