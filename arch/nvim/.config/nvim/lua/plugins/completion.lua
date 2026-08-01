local M = {}

function M.setup()
  local blink = require 'blink.cmp'

  blink.setup {
    keymap = {
      preset = 'none',

      ['<Tab>'] = {
        'select_next',
        'snippet_forward',
        'fallback',
      },

      ['<S-Tab>'] = {
        'select_prev',
        'snippet_backward',
        'fallback',
      },

      ['<CR>'] = {
        'accept',
        'fallback',
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
    },

    completion = {
      menu = {
        auto_show = true,
      },

      documentation = {
        auto_show = true,
      },

      trigger = {
        show_on_insert_on_trigger_character = true,
      },
    },

    snippets = {
      preset = 'luasnip',
    },

    sources = {

      default = {
        'lsp',
        'path',
        'snippets',
        'buffer',
      },
    },

    signature = {
      enabled = true,
    },
  }
end

return M
