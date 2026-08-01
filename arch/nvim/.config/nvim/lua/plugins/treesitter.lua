local M = {}

function M.setup()
  require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath 'data' .. '/site',
  }

  local parsers = {
    'lua',
    'vim',
    'vimdoc',
    'bash',
    'json',
    'yaml',
    'markdown',

    'python',
    'go',
    'gomod',

    'javascript',
    'typescript',
    'tsx',
  }

  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)

      if not lang then return end

      -- Start treesitter if parser exists
      pcall(vim.treesitter.start, args.buf, lang)
    end,
  })
end

return M
