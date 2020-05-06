# Load "system" settings
source "%val{config}/commands.kak"
source "%val{config}/aliases.kak"
source "%val{config}/mappings.kak"
source "%val{config}/plugins.kak"
source "%val{config}/hooks.kak"
source "%val{config}/options.kak"
source "%val{config}/theme/default.kak"

# Try loading "user" settings
try %{ source "%val{config}/user/kakrc" }

# Source a local project kak config if it exists
try %{ source .kakrc.local }
