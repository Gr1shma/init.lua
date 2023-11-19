vim.g.mapleader = " "
vim.g.maplocalleader = ";"
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("n", "<C-r", vim.cmd.so)

-- cellularautomation
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
