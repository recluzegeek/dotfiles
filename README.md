# dotfiles

## structure

each folder is a package. structure mirrors $HOME.

example:
i3wm/.config/i3/config → ~/.config/i3/config

## usage

from repo root:

stow <package>

example:
stow i3wm

## adding configs

1. move config into repo:
   mv ~/.config/<app> <package>/.config/

2. stow it:
   stow <package>

## removing

stow -D <package>

## notes

* run from repo root
* one package per app
* avoid mixing unrelated configs
