function limamk --description "Create, start and provision a new lima virtual machine"
    if test (count $argv) -ne 2
        echo "Usage: limamk <template> <name>"
        return 1
    end
    set template $argv[1]
    set name $argv[2]

    # Set up the VM and wait for it to come up
    limactl create --tty=false --name "$name" "template:$template"
    limactl start "$name"

    # Kill SSH control master as that's set up without agent forwarding
    ssh -O exit "lima-$name" || true

    # Clone my dotfiles repositories into the VM
    ssh -A "lima-$name" "git clone git@github.com:csutter/setup.git ~/src/csutter/setup"
    ssh -A "lima-$name" "git clone git@github.com:csutter/setup-private.git ~/src/csutter/setup-private"
end
