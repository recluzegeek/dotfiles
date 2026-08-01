local M = {}

function M.setup()

    vim.keymap.set(
        "n",
        "<leader>tt",
        function()
            Snacks.terminal()
        end,
        {
            desc = "Terminal",
        }
    )

end

return M
