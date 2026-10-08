# Disable file completion
complete -c vm -f

# Subcommands
complete -c vm -n '__fish_is_nth_token 1' -a new -d 'Create a new VM'
complete -c vm -n '__fish_is_nth_token 1' -a start -d 'Start a VM'
complete -c vm -n '__fish_is_nth_token 1' -a enter -d 'SSH into a VM'
complete -c vm -n '__fish_is_nth_token 1' -a stop -d 'Stop a VM'

# Existing VM names
complete -c vm -n '__fish_is_nth_token 2; and __fish_seen_subcommand_from start enter stop' -a '(limactl list --quiet)'
