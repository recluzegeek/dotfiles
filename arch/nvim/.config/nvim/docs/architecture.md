# Architecture

## Philosophy

This configuration treats Neovim as a modular development environment.

Each module owns one capability.

Examples:

- navigation.lua → finding and moving through projects
- explorer.lua → filesystem browsing
- terminal.lua → shell workflow
- treesitter.lua → syntax parsing
- lsp.lua → language intelligence


## Plugin management

Plugins are installed using Neovim's native vim.pack.

The responsibilities are separated:

vim.pack:
- Neovim plugins

Mason:
- language servers
- formatters
- linters
- debugging tools


## Loading order

init.lua follows this order:

1. Leader configuration
2. Plugin installation
3. Core options
4. Keymaps
5. Plugin modules

The goal is predictable startup behavior.
