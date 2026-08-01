local M = {}

function M.setup()
  require('persistence').setup {

    options = {
      'buffers',
      'curdir',
      'tabpages',
      'winsize',
      'help',
      'globals',
    },
  }
end

return M
