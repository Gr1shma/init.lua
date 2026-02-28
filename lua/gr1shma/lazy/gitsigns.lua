return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "─" },
			topdelete = { text = "─" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "─" },
			topdelete = { text = "─" },
			changedelete = { text = "~" },
		},
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 1000,
			ignore_whitespace = false,
			virt_text_priority = 100,
			use_focus = true,
		},
	},
	config = function(_, opts)
		require("gitsigns").setup(opts)

		-- Very dim colors
		-- vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#2d3d2d" })
		-- vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#3d3d2d" })
		-- vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#3d2d2d" })
		-- vim.api.nvim_set_hl(0, "GitSignsAddStaged", { fg = "#2d3d2d" })
		-- vim.api.nvim_set_hl(0, "GitSignsChangeStaged", { fg = "#3d3d2d" })
		-- vim.api.nvim_set_hl(0, "GitSignsDeleteStaged", { fg = "#3d2d2d" })
	end,
}
