local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>e', function() Snacks.explorer() end, {
    desc = 'Explorer',
  })
end

return M
