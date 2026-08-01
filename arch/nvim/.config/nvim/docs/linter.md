# Linting

## Purpose

Linters detect problems and enforce rules.

Linting is separate from:

- LSP
- formatting

## Current linter stack

| Language   | Linter        |
| ---------- | ------------- |
| Python     | ruff          |
| Go         | golangci-lint |
| JavaScript | biome         |
| TypeScript | biome         |
| Markdown   | markdownlint  |

## Tool choices

## Python

Instead of:

- flake8
- pylint
- isort

we use:

ruff

Ruff replaces many traditional Python tools with a Rust implementation.

## Go

golangci-lint provides strict static analysis.

Combined with:

gopls +
gofumpt

this gives a complete Go workflow.

## JavaScript / TypeScript

Instead of:

eslint +
prettier

we use:

biome

Biome combines:

- linting
- formatting

with a Rust implementation.

## Markdown

marksman:

- navigation
- references

markdownlint:

- style checks
