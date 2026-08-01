local M = {}

function M.setup()
  local lint = require 'lint'

  lint.linters_by_ft = {

    python = {
      'ruff',
    },

    go = {
      'golangci-lint',
    },

    javascript = {
      'biomejs',
    },

    typescript = {
      'biomejs',
    },

    markdown = {
      'markdownlint',
    },
  }

  vim.api.nvim_create_autocmd({
    'BufWritePost',
    'BufEnter',
  }, {
    callback = function() lint.try_lint() end,
  })
end

return M
