# Explicitly set XDG_CONFIG_HOME to make sure it's there
set -gx XDG_CONFIG_HOME "$HOME/.config"

# Set up Aqua
fish_add_path "$HOME/.local/share/aquaproj-aqua/bin"
set -gx AQUA_GLOBAL_CONFIG "$XDG_CONFIG_HOME/aqua/aqua.yaml"
