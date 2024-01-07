return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup({
      scope = { exclude = { language = { "lua" }}},
      debounce = 100,
      indent = { char = "╎" },
      whitespace = { highlight = { "Whitespace", "NonText" } },
      scope = { exclude = { language = { "lua", "html", "javascript", "typescript", "rust", "go", "c","cpp", "java" } } },
    })
  end,
}
