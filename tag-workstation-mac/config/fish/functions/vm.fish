function vm --description 'Manage Lima VMs'
  if test (count $argv) -ne 2
    echo 'Usage: vm <new|start|enter|stop> <name>' >&2
    return 1
  end

  set -l name $argv[2]

  switch $argv[1]
    case new
      limactl create --tty=false --name $name template:base
        and limactl start $name
        and limactl autostart enable $name
        # Fix potential SSH socket issues due to lingering master created without agent forwarding
        and ssh -O check lima-$name 2>/dev/null
        and ssh -O exit lima-$name
    case start
      limactl start $name
    case enter
      ssh -A lima-$name
    case stop
      limactl stop $name
    case '*'
      echo "vm: unknown subcommand '$argv[1]'" >&2
      return 1
  end
end
