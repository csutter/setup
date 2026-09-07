# Usage: make [HOST=<host>] <target>
#
# Targets:
#   install    run complete bootstrap process for HOST
#   packages   install packages for the detected OS
#   dotfiles   apply rcm dotfiles for HOST
#   set-shell  add fish as a permissible shell and set it as the default shell for the current user

DOTFILES_DIR := $(CURDIR)
HOST_DIR     := $(DOTFILES_DIR)/host-$(HOST)
RCRC         := $(HOST_DIR)/rcrc
UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
  OS := macos
	RCM_PATH := /opt/homebrew/bin
else
  OS := unknown
endif

# Include host-specific environment variables if available
-include $(HOST_DIR)/env.mk

.DEFAULT_GOAL := help
.PHONY: help check-host install dotfiles packages packages-macos packages-unknown set-shell

help:
	@sed -n 's/^# \{0,1\}//p' $(firstword $(MAKEFILE_LIST))

check-host:
	@test -n "$(HOST)" || { echo "error: HOST is required, e.g. make HOST=laptop <target>" >&2; exit 1; }
	@test -f "$(RCRC)"  || { echo "error: no rcrc found at $(RCRC)" >&2; exit 1; }

install: check-host packages set-shell dotfiles

packages: check-host packages-$(OS)

packages-macos:
	brew bundle install --file="$(DOTFILES_DIR)/tag-os-macos/config/homebrew/Brewfile"
	brew services start colima

packages-unknown:
	@echo "error: unsupported OS ($(UNAME))" >&2; exit 1

dotfiles: check-host
	RCRC="$(RCRC)" HOSTNAME="$(HOST)" $(RCM_PATH)/rcup -v -d "$(DOTFILES_DIR)"

set-shell: check-host
ifdef SETUP_SKIP_SET_SHELL
	@echo "SETUP_SKIP_SET_SHELL is set; skipping /etc/shells update and chsh"
else
	@FISH_PATH="$$(command -v fish)"; \
	if [ -z "$$FISH_PATH" ]; then \
		echo "error: fish is not installed or not on PATH" >&2; \
		exit 1; \
	fi; \
	echo "Found fish at $$FISH_PATH"
	@if ! grep -qxF "$$(command -v fish)" /etc/shells; then \
		echo "Adding $$(command -v fish) to /etc/shells (requires sudo)..."; \
		echo "$$(command -v fish)" | sudo tee -a /etc/shells > /dev/null; \
	else \
		echo "$$(command -v fish) already present in /etc/shells"; \
	fi; \
	echo "Setting default shell for $$(whoami) to $$(command -v fish)..."; \
	chsh -s "$$(command -v fish)"
endif
