require('rose-pine').setup({
    disable_background = true
})

require("tokyonight").setup({
  terminal_colors = true,
  transparent = true,
})

require("catppuccin").setup({
  transparent_background = true,
  term_color = true,
})

function ColorMyPencils(color) 
	color = color or "catppuccin-mocha"  or "rose-pine"
  -- "catppuccin-mocha" or "tokyonight-night" 
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
