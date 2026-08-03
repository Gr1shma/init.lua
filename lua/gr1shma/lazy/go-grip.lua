return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		dir = vim.fn.stdpath("config"),
		name = "go-grip-preview",
		lazy = false,
		config = function()
			local grip_job = nil

			local function kill_grip()
				if grip_job then
					vim.fn.jobstop(grip_job)
					grip_job = nil
					vim.notify("go-grip: server stopped", vim.log.levels.INFO)
				end
			end

			vim.api.nvim_create_user_command("GripOpen", function()
				local ft = vim.bo.filetype
				if ft ~= "markdown" then
					vim.notify("go-grip: not a markdown file", vim.log.levels.WARN)
					return
				end

				kill_grip()

				local file = vim.api.nvim_buf_get_name(0)
				if file == "" then
					vim.notify("go-grip: buffer has no file name", vim.log.levels.WARN)
					return
				end

				grip_job = vim.fn.jobstart({ "go-grip", file }, {
					detach = false,
					on_exit = function()
						grip_job = nil
					end,
				})

				if grip_job <= 0 then
					vim.notify("go-grip: failed to start (is 'go-grip' in PATH?)", vim.log.levels.ERROR)
					grip_job = nil
				else
					vim.notify("go-grip: serving " .. vim.fn.fnamemodify(file, ":t"), vim.log.levels.INFO)
				end
			end, { desc = "Open current markdown in go-grip preview" })

			vim.api.nvim_create_user_command("GripClose", function()
				if grip_job then
					kill_grip()
				else
					vim.notify("go-grip: no server running", vim.log.levels.WARN)
				end
			end, { desc = "Stop the go-grip preview server" })

			vim.api.nvim_create_autocmd("VimLeave", {
				group = vim.api.nvim_create_augroup("GripCleanup", { clear = true }),
				callback = kill_grip,
				desc = "Kill go-grip server when Neovim exits",
			})
		end,
	},
}
