local M = {}

function M.setup()
  local fzf = require 'fzf-lua'

  fzf.setup {
    winopts = {
      height = 0.85,
      width = 0.80,
      preview = {
        layout = 'vertical',
      },
    },
  }

  vim.keymap.set('n', '<leader>ff', fzf.files, {
    desc = 'Find Files',
  })

  vim.keymap.set('n', '<leader>fg', fzf.live_grep, {
    desc = 'Live Grep',
  })

  vim.keymap.set('n', '<leader>fb', fzf.buffers, {
    desc = 'Find Buffers',
  })

  vim.keymap.set('n', '<leader>fh', fzf.help_tags, {
    desc = 'Search Help',
  })
end

return M
