# dotfiles

Manage dotfiles using GNU Stow.

## idea

This repo is the **source of truth**.
Actual config or dotfiles live inside the repo and `$HOME` only contains symlinks.

Stow does NOT import files automatically. You must move configs into this repo first.

## example (i3)

* original location:
  ~/.config/i3/config

* mirror structure in repo:
  i3wm/.config/i3/config

* move files into repo:
  mv ~/.config/i3 i3wm/.config/

* apply symlinks:
  stow i3wm

Result:
~/.config/i3 → ~/dotfiles/i3wm/.config/i3

## structure

Each folder = one package.
Structure must mirror `$HOME`.

example:
i3wm/.config/i3/config → ~/.config/i3/config

## usage

Run from repo root:

`stow \<package\>`

example:
`stow i3wm`

## adding configs

1. create package:
   `mkdir -p <package>/.config`

2. move config:
   `mv ~/.config/<app> <package>/.config/`

3. stow:
   `stow \<package\>`

## removing

`stow -D \<package\>`

## notes

* always run stow from repo root
* one package per app (recommended)
* do NOT track caches, temp files, or large junk
* check symlinks with: ls -l
