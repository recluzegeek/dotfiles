require('conform').setup({
  notify_on_error = false,
  format_on_save = {
    timeout_ms = 800, -- Ruff and Go tools are fast, but golangci processes can take a moment
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    -- Python formatting handled natively via your new Rust-powered toolchain
    python = { 'ruff_fix', 'ruff_format' }, 
    -- Go formatting explicitly set to run strict gofumpt formatting constraints
    go = { 'gofumpt' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    markdown = { 'prettier' },
  },
})

vim.keymap.set('n', '<leader>f', function() require('conform').format({ async = true }) end, { desc = 'Format buffer manually' })

