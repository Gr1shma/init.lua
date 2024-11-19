return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    "theprimeagen/refactoring.nvim",
    "nvim-treesitter/nvim-treesitter-context",
    "eandrju/cellular-automaton.nvim",
    "luckasRanarison/tailwind-tools.nvim",

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
}
