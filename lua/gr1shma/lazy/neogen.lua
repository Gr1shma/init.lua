return {
	"danymat/neogen",
	dependencies = "nvim-treesitter/nvim-treesitter",
	keys = {
		{
			"<leader>nf",
			function()
				require("neogen").generate({ type = "func" })
			end,
			desc = "Generate function annotation",
		},
		{
			"<leader>nt",
			function()
				require("neogen").generate({ type = "type" })
			end,
			desc = "Generate type annotation",
		},
		{
			"<leader>nd",
			function()
				require("neogen").generate({ type = "typedef" })
			end,
			desc = "Generate typedef annotation",
		},
	},
	opts = {},
}
