# setup
Bootstrapping and dotfiles for my machines

> [!WARNING]
>
> This repository is open in the spirit of sharing and providing inspiration, but the configuration
> is specific to my own setup so there are no guarantees anything will work for you, and no
> contributions accepted.

## Prerequisites
### macOS
- Homebrew, ideally using the pkg installer [for the latest release][homebrew]

[homebrew]: https://github.com/Homebrew/brew/releases

### Linux
- GNU Make available

## Setup on a new machine
- Clone this repository into `~/src/csutter/setup` from the public HTTPS remote
- Create a new host-specific `rcrc` file for the machine, for example `host-foobar/rcrc` (see
  existing host directories for inspiration)
- Run `HOST=foobar make install`
  - Note that rcm is notoriously bad at hostname handling on macOS, so the Makefile mandates
    specifying it explicitly
- Generate SSH keys on the host
  - macOS: use Secretive, which is installed as a Homebrew cask
- Create a host-specific `config/git/config.signingkey` with the public key to be used for signing
  commits, and add it to `config/git/allowedsigners` too
- Add the signing and SSH keys from the host to GitHub and other forges
- Replace the `origin` remote for the local repo clone with the read/write one
- Check out the private companion repository into `~/src/csutter/setup-private`
- Re-run `HOST=foobar make dotfiles` to include content from the private repository

## Tags
This repository uses rcm tags configured in host-specific `rcrc` files to configure sets of dotfiles
to apply:

- [os-linux](tag-os-linux/): Any machine with Linux
- [os-macos](tag-os-macos/): Any machine with macOS
- [type-workstation](tag-type-workstation/): A physical, local, pet workstation I sit in front of
      and use interactively (as opposed to remote servers, containers, VMs, ...)
