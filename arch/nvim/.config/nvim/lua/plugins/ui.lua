local M = {}

function M.setup()

    local Snacks = require("snacks")

    Snacks.setup({
        bigfile = {
            enabled = true,
        },

        dashboard = {
            enabled = false,
        },

        explorer = {
            enabled = true,
        },

        input = {
            enabled = true,
        },

        notifier = {
            enabled = true,
        },

        terminal = {
            enabled = true,
        },

        indent = {
            enabled = true,
        },

        scope = {
            enabled = true,
        },
    })


    require("which-key").setup({
        preset = "modern",
        delay = 30,

        triggers = {
            {
                "<leader>",
                mode = {
                    "n",
                    "v",
                },
            },
        },
    })

end

return M
