return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ bufnr = 0 })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			go = { "gofmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			elixir = { "mix" },
			rust = { "rustfmt", lsp_format = "fallback" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			zsh = { "shfmt" },
		},
		formatters = {
			["clang-format"] = {
				prepend_args = { "-style=file", "-fallback-style=LLVM" },
			},
		},
	},
}
