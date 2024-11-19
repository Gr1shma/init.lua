return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        local neogen = require("neogen").setup({})

        vim.keymap.set("n", "<leader>nf", function()
            neogen.generate({ type = "func" })
        end)
        vim.keymap.set("n", "<leader>nt", function()
            neogen.generate({ type = "type" })
        end)
        vim.keymap.set("n", "<leader>nd", function()
            neogen.generate({ type = "typedef" })
        end)
    end,
}
