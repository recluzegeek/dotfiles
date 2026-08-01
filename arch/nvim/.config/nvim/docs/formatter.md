# Formatting

## Purpose

Formatters rewrite source code into a consistent style.

Formatting is separate from LSP.

## Architecture

```bash

Buffer
|
|
conform.nvim
|
+-- formatter binary

```

## Current formatter stack

| Language   | Formatter   |
| ---------- | ----------- |
| Lua        | stylua      |
| Python     | ruff format |
| Go         | gofumpt     |
| JavaScript | biome       |
| TypeScript | biome       |
| Markdown   | prettier    |

## Why separate formatting?

A language server understands code.

A formatter changes code style.

They solve different problems.

Example:

LSP:

"where is this function defined?"

Formatter:

"should this brace be here?"

## Future configuration

Formatting will provide:

- format on save
- manual formatting command
- async formatting
