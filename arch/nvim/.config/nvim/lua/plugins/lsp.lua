require('mason').setup()

local servers = {
  -- Python: Multi-LSP Strategy
  pyright = {
    settings = {
      pyright = { disableOrganizeImports = true }, -- Handled natively by Ruff
      python = { analysis = { ignore = { '*' } } }, -- Let Ruff dictate lint warnings cleanly
    }
  },
  ruff = {}, -- Fast Rust-powered linter & formatter for Python

  -- Go: Multi-LSP Strategy
  gopls = {}, 
  golangci_lint_ls = {}, -- Maps golangci-lint diagnostic diagnostics directly to code

  -- Core Web Languages
  ts_ls = {},              
  marksman = {},           
  lua_ls = {               
    settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
  }
}

-- Registry of dependencies that Mason automatically tracks
local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, {
  'stylua',           -- Lua Formatter
  'gofumpt',          -- Strict Go Formatter (Cleaner than standard gofmt)
  'golangci-lint',    -- Go strict engine binary
  'prettier',         -- JS/TS/Markdown formatter
})

require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = require('blink.cmp').get_lsp_capabilities(server.capabilities)
      require('lspconfig')[server_name].setup(server)
    end,
  },
})

-- Navigation Mappings Hook
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = desc })
    end
    map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')
    map('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
    map('gI', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame (Refactor Symbol)')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
  end
})

