local M = {}

function M.map(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    desc = desc,
    silent = true,
  })
end

return M
