# Load "system" settings
source "%val{config}/commands.kak"
source "%val{config}/aliases.kak"
source "%val{config}/mappings.kak"
source "%val{config}/options.kak"
# Try loading "user" settings
try %{ source "%val{config}/user/kakrc" }
# Source a local project kak config if it exists
try %{ source .kakrc.local }
source "%val{config}/theme/%opt{kide_theme}.kak"
source "%val{config}/plugins.kak"
