# Registers

## Purpose

Neovim uses registers as storage locations for text.

Unlike GUI editors, copying and deleting are separate concepts.

## Important registers

| Register | Purpose           |
| -------- | ----------------- |
| "        | default register  |
| 0        | last yank         |
| +        | system clipboard  |
| *        | primary selection |
| _        | black hole        |

## Clipboard

System clipboard is enabled through:

```lua
vim.opt.clipboard = "unnamedplus"
```

Copying from outside Neovim uses:

```
"+
```

## Safe deletion

Normal delete:

```
d
x
c
```

replace the unnamed register.

For deletions where the text is not needed:

```
"_d
"_x
```

The black hole register discards the text.

## Recommended workflow

Replace code:

1. Yank desired text

```
y
```

2. Select old text

```
v
```

3. Delete

```
d
```

4. Paste

```
p
```

The yank register remains available.

## Keymaps

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>sr` | Search registers |

````

# 4. Update docs/keymaps.md

Add:

```md
## Registers

| Key | Action |
|-----|--------|
| <leader>sr | Search registers |
````
