# setup
Unified dotfiles for my machines

> [!WARNING]
>
> This repository is open in the spirit of sharing and providing inspiration, but the configuration
> is specific to my own setup so there are no guarantees anything will work for you, and no
> contributions accepted.

## Targets
Most of my dotfiles are agnostic across operating systems and environments, but there are
differences between the two main places I use them which are handled by [rcm tags][tags]:
- [workstation-mac](tag-workstation-mac/): macOS workstations, such as a personal or work Mac
- [dev-vm](tag-dev-vm/): Linux virtual machines for development, separated per project or group of
  projects

Each tag contributes an `rcrc` appropriate to its target. Some limited host-specific configuration
can also be added through [rcm's `host-XXX` directories][host] where absolutely necessary.

[host]: https://thoughtbot.github.io/rcm/#HOST_SPECIFIC_DOTFILES
[tags]: https://thoughtbot.github.io/rcm/#TAGGED_DOTFILES

## Setting up a new workstation Mac
The creation and bootstrapping of development VMs should be entirely scripted, but bootstrapping a
new Mac happens so rarely that the bit of manual effort involved isn't worth automating.

### Prerequisites
Install Homebrew using the pkg installer [for the latest release][homebrew].

[homebrew]: https://github.com/Homebrew/brew/releases

### Clone repository and initial setup
Set up my public dotfiles and install software packages through good old `Terminal.app`:
```bash
# Manually install `rcm` (remaining packages will be handled by `brew bundle`)
/opt/homebrew/bin/brew install rcm

# Clone the public dotfiles repo
mkdir -p ~/src/csutter/setup
git clone https://github.com/csutter/setup ~/src/csutter/setup

# Set up initial set of dotfiles
/opt/homebrew/bin/rcup -d ~/src/csutter/setup -t workstation-mac

# Install all remaining software
/opt/homebrew/bin/brew bundle install

# Change shell to fish
echo "/opt/homebrew/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish
```

Terminate the `Terminal.app` session, and open Ghostty (installed as Homebrew cask) to verify Fish
is available and configured correctly.

### Generate and set up SSH and Git signing keys
Using Secretive (installed as Homebrew cask) and set up an SSH key and Git signing key.

Add the public signing key to a local `~/.config/git/config.signingkey` as well as
[`config/git/allowedsigners`](config/git/allowedsigners).

Upload the SSH and/or signing public keys to all relevant Git forges.

### Migrate public dotfiles to read/write origin; commit `allowedsigners` changes
```bash
cd ~/src/csutter/setup

git remote set-url origin git@github.com:csutter/setup.git
git add .
git commit -m "Add new signing key for <...>"
git push
```

### Set up private companion dotfiles
This contains mostly proprietary and/or non-free things, for example commercial fonts, that I can't
share in this public repository.

```bash
git clone git@github.com:csutter/setup-private.git ~/src/csutter/setup-private

# Re-run `rcup` to symlink the new dotfiles
rcup
```

## Tags
This repository uses rcm tags configured in host-specific `rcrc` files to configure sets of dotfiles
to apply:

- [os-linux](tag-os-linux/): Any machine with Linux
- [os-macos](tag-os-macos/): Any machine with macOS
- [type-workstation](tag-type-workstation/): A physical, local, pet workstation I sit in front of
      and use interactively (as opposed to remote servers, containers, VMs, ...)
