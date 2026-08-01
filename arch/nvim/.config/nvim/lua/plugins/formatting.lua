local M = {}

function M.setup()
  require('conform').setup {

    notify_on_error = true,

    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },

    formatters_by_ft = {

      lua = {
        'stylua',
      },

      python = {
        'ruff_format',
      },

      go = {
        'gofumpt',
      },

      zig = {
        'zig_fmt',
      },

      javascript = {
        'biome',
      },

      typescript = {
        'biome',
      },

      markdown = {
        'prettier',
      },
    },
  }

  vim.keymap.set('n', '<leader>f', function()
    require('conform').format {
      async = true,
      lsp_fallback = true,
    }
  end, {
    desc = 'Format buffer',
  })
end

return M
