return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		debounce = 100,
		indent = { char = "╎" },
		whitespace = { highlight = { "Whitespace", "NonText" } },
		scope = { enabled = false },
	},
}
