local M = {}

function M.setup()
	local npairs = require("nvim-autopairs")

	npairs.setup({
		check_ts = true,

		disable_filetype = {
			"TelescopePrompt",
			"snacks_picker_input",
		},

		enable_check_bracket_line = true,

		fast_wrap = {},

		map_bs = true,
		map_cr = true,
	})
end

return M
