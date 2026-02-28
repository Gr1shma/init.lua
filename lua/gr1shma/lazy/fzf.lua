return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "FzfLua",
	keys = {
		{ "<leader>pf", "<cmd>FzfLua files<cr>", desc = "Fzf files" },
		{ "<C-p>", "<cmd>FzfLua git_files<cr>", desc = "Fzf git files" },
		{ "<leader>pws", "<cmd>FzfLua grep_cword<cr>", desc = "Fzf grep <cword>" },
		{ "<leader>pWs", "<cmd>FzfLua grep_cWORD<cr>", desc = "Fzf grep <cWORD>" },
		{
			"<leader>ps",
			function()
				require("fzf-lua").grep({ search = vim.fn.input("Grep > ") })
			end,
			desc = "Fzf grep string",
		},
		{ "<leader>vh", "<cmd>FzfLua help_tags<cr>", desc = "Fzf help tags" },
	},
	opts = {},
}
