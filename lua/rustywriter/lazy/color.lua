function ColorMyPencils(color) 
  color = color or "catppuccin-mocha" or "rose-pine"
  -- "catppuccin-mocha" or "tokyonight-night" 
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  { 
    'folke/tokyonight.nvim',
    name = 'tokyonight',
    config = function()
      require("tokyonight").setup({
        style = "strom",
        terminal_colors = true,
        transparent = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        }
      })
    end
  },
  { 
    "catppuccin/nvim", 
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        term_color = true,
      })
    end,
  },
  { 
    "rose-pine/neovim",
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        disable_background = true
      })
      vim.cmd("colorscheme catppuccin")
      ColorMyPencils()
    end
  },
}
