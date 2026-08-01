
# LSP

## Purpose

Language Server Protocol provides code intelligence.

LSP handles:

- go to definition
- hover documentation
- rename symbols
- diagnostics
- code actions
- semantic completion


## Architecture

```

Neovim
|
+-- vim.lsp
|
+-- language servers

```


## Current language servers

| Language | Server | Responsibility |
|-|-|-|
| Lua | lua_ls | Lua intelligence |
| Python | pyright | Python intelligence |
| Go | gopls | Go intelligence |
| JS/TS | ts_ls | JavaScript and TypeScript intelligence |
| Markdown | marksman | Markdown navigation |


## What LSP does not do

LSP is not responsible for:

- formatting
- linting
- autosave


Those are separate modules.


## Troubleshooting


Check active servers:

```

:LspInfo

```


Check health:

```

:checkhealth lsp

```


Check active clients:

```

:lua print(vim.inspect(vim.lsp.get_clients()))

```


## Design decision

We intentionally do not use:

- mason-lspconfig
- mason-tool-installer

The configuration keeps the dependency graph explicit.

Mason installs binaries.
Neovim configures them.

