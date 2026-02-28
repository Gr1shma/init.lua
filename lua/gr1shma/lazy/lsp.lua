return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		{
			"saghen/blink.cmp",
			version = "*",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					version = "v2.*",
					build = "make install_jsregexp",
					dependencies = { "rafamadriz/friendly-snippets" },
					config = function()
						local ls = require("luasnip")
						ls.filetype_extend("javascript", { "jsdoc" })
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {
				keymap = {
					preset = "default",
					["<CR>"] = { "select_and_accept", "fallback" },
				},
				appearance = {
					nerd_font_variant = "mono",
				},
				completion = {
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 200,
					},
				},
				sources = {
					default = { "lazydev", "lsp", "path", "snippets", "buffer" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
				signature = { enabled = true },
				fuzzy = { implementation = "prefer_rust_with_warning" },
				snippets = { preset = "luasnip" },
			},
			opts_extend = { "sources.default" },
		},
	},
	config = function()
		require("fidget").setup()
		require("mason").setup()

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"gopls",
				"rust_analyzer",
				"emmet_ls",
				"clangd",
				"astro",
				"cssls",
				"tailwindcss",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						capabilities = capabilities,
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								format = {
									enable = true,
									defaultConfig = {
										indent_style = "space",
										indent_size = "2",
									},
								},
							},
						},
					})
				end,

				["tailwindcss"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.tailwindcss.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"css",
							"scss",
							"javascript",
							"javascriptreact",
							"typescript",
							"typescriptreact",
							"vue",
							"svelte",
							"heex",
						},
					})
				end,
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
