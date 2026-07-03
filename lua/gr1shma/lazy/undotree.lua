return {
	"mbbill/undotree",
	cmd = "UndotreeToggle",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
	},
	init = function()
		local undodir = vim.fn.stdpath("state") .. "/undo"
		vim.fn.mkdir(undodir, "p")
		vim.opt.undofile = true
		vim.opt.undodir = undodir
	end,
}
