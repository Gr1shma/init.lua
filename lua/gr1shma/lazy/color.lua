local function ColorMyPencils(color)
	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

vim.api.nvim_create_user_command("ColorMyPencils", function(opts)
	ColorMyPencils(opts.args)
end, {
	nargs = "?",
	complete = "color",
})

return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "mocha",
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = false,
			dim_inactive = {
				enabled = false,
			},
			no_italic = true,
			no_bold = true,
			no_underline = true,
			styles = {
				comments = {},
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			integrations = {
				treesitter = true,
				markdown = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			ColorMyPencils()
		end,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		opts = {
			style = "night",
			transparent = true,
			terminal_colors = false,
			styles = {
				comments = {},
				keywords = {},
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			variant = "moon",
			dark_variant = "moon",
			disable_background = true,
			disable_float_background = true,
			disable_italics = true,
			styles = {
				bold = false,
				italic = false,
				transparency = true,
			},
		},
	},
}
