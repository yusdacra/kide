source "%val{config}/plugin/plug.kak/rc/plug.kak"
source "%val{config}/commands.kak"
source "%val{config}/aliases.kak"
source "%val{config}/mappings.kak"
source "%val{config}/options.kak"
source "%val{config}/plugins.kak"
evaluate-commands %sh{
    for f in $kak_config/language/*; do
        echo "source $f"
    done
}
kide-enable-theme "default"


# Try loading "user" settings
try %{ source "%val{config}/user/kakrc" }
# Source a local project kak config if it exists
try %{ source .kakrc.local }
