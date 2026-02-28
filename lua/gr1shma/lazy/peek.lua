return {
	"toppair/peek.nvim",
	build = "deno task --quiet build:fast",
	ft = { "markdown" },
	cmd = { "PeekOpen", "PeekClose" },
	opts = {
		filetype = { "markdown", "conf" },
		app = "browser",
	},
	config = function(_, opts)
		require("peek").setup(opts)

		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
}
