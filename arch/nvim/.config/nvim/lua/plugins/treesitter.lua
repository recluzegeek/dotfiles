local M = {}

function M.setup()

    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "bash",
            "json",
            "yaml",
            "markdown",

            "python",
            "go",
            "gomod",

            "javascript",
            "typescript",
            "tsx",
        },

        highlight = {
            enable = true,
        },

        indent = {
            enable = true,
        },

        auto_install = true,
    })

end

return M
