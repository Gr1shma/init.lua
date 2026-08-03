return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	cmd = { "Obsidian" },
	keys = {
		{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "new note" },
		{ "<leader>ot", "<cmd>Obsidian template<cr>", desc = "insert template" },
		{ "<leader>os", "<cmd>Obsidian search<cr>", desc = "search notes" },
		{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "backlinks" },
		{ "<leader>of", "<cmd>Obsidian quick_switch<cr>", desc = "quick switch" },
		{ "<leader>ol", "<cmd>Obsidian links<cr>", desc = "note links" },
		{ "<leader>oT", "<cmd>Obsidian toc<cr>", desc = "table of contents" },
		{ "<leader>or", "<cmd>Obsidian rename<cr>", desc = "rename note" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
	},
	opts = {
		workspaces = {
			{
				name = "abstract",
				path = "~/dox/abstract",
			},
		},
		templates = {
			folder = "notes/_templates/",
			date_format = "%Y-%m-%d",
			substitutions = {},
		},
		notes_subdir = "",
		new_notes_location = "current_dir",
		legacy_commands = false,
		link = {
			style = "wiki",
		},
		picker = {
			name = "fzf-lua",
		},
		note_id_func = function(title)
			return title
		end,
		frontmatter = {
			enabled = false,
		},
		checkbox = {
			order = { " ", "x" },
		},
		ui = { enable = true },
		callbacks = {
			enter_note = function()
				local actions = require("obsidian.actions")
				vim.keymap.set("n", "<leader>oc", actions.toggle_checkbox, {
					buffer = true,
					desc = "toggle checkbox",
				})
				vim.keymap.set("n", "<Tab>", function()
					actions.nav_link("next")
				end, { buffer = true, desc = "next link" })
				vim.keymap.set("n", "<S-Tab>", function()
					actions.nav_link("prev")
				end, { buffer = true, desc = "prev link" })
			end,
		},
	},
}
