return {
	"tpope/vim-fugitive",
	cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
	keys = {
		{ "<leader>gs", vim.cmd.Git, desc = "Git status" },
		{ "gu", "<cmd>diffget //2<CR>", desc = "Diffget left (ours)" },
		{ "gh", "<cmd>diffget //3<CR>", desc = "Diffget right (theirs)" },
	},
	config = function()
		local TheGrishma_Fugitive = vim.api.nvim_create_augroup("TheGrishma_Fugitive", {})

		vim.api.nvim_create_autocmd("BufWinEnter", {
			group = TheGrishma_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, opts)

				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)

				vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts)
			end,
		})
	end,
}
