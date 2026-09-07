# Usage: make [HOST=<host>] <target>
#
# Targets:
#   install    run complete bootstrap process for HOST
#   packages   install packages for the detected OS
#   dotfiles   apply rcm dotfiles for HOST

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

.DEFAULT_GOAL := help
.PHONY: help check-host install dotfiles packages packages-macos packages-unknown

help:
	@sed -n 's/^# \{0,1\}//p' $(firstword $(MAKEFILE_LIST))

check-host:
	@test -n "$(HOST)" || { echo "error: HOST is required, e.g. make HOST=laptop <target>" >&2; exit 1; }
	@test -f "$(RCRC)"  || { echo "error: no rcrc found at $(RCRC)" >&2; exit 1; }

install: check-host packages dotfiles

packages: packages-$(OS)

packages-macos:
	brew bundle install --file="$(DOTFILES_DIR)/tag-os-macos/config/homebrew/Brewfile"
	brew services start colima

packages-unknown:
	@echo "error: unsupported OS ($(UNAME))" >&2; exit 1

dotfiles: check-host
	RCRC="$(RCRC)" HOSTNAME="$(HOST)" $(RCM_PATH)/rcup -v -d "$(DOTFILES_DIR)"
