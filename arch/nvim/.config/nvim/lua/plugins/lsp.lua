local M = {}

function M.setup()
  require('mason').setup()

  local servers = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = {
              'vim',
            },
          },
        },
      },
    },

    gopls = {},

    pyright = {},

    ts_ls = {},

    marksman = {},
  }

  for server, config in pairs(servers) do
    config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)

    vim.lsp.config(server, config)

    vim.lsp.enable(server)
  end

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
      local opts = {
        buffer = event.buf,
        silent = true,
      }

      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end,
  })
end

return M
