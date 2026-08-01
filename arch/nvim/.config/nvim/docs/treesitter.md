# Treesitter

## Purpose

Treesitter provides structural understanding of source code.

It powers:

- syntax highlighting
- parsing
- indentation support
- code-aware features
- future text objects and motions

## Architecture

Modern Neovim separates responsibilities:

```bash

Neovim core
|
+-- vim.treesitter.start()
|       |
|       +-- syntax highlighting
|
|
nvim-treesitter plugin
|
+-- parser management
+-- queries
+-- language support

```

## Why we don't use old configurations

Older configurations commonly use:

```lua
require("nvim-treesitter.configs").setup({
    highlight = {
        enable = true,
    },
})
```

This API belongs to the older nvim-treesitter architecture.

With newer Neovim versions, especially Neovim 0.12+, this module may not exist.

The error looks like:

```
module 'nvim-treesitter.configs' not found
```

This does not mean Treesitter failed to install.

It means the configuration API changed.

## Current setup

Our configuration uses:

```lua
vim.treesitter.start()
```

to attach parsers to buffers.

The plugin handles:

- parser availability
- query files
- language support

Neovim handles:

- parser startup
- highlighting

## Supported languages

Current parser targets:

- Lua
- Vim
- Vimdoc
- Bash
- JSON
- YAML
- Markdown
- Python
- Go
- JavaScript
- TypeScript
- TSX
