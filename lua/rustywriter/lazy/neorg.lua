return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = { "nvim-lua/plenary.nvim", { "nvim-neorg/neorg-telescope" } },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.journal"] = {
          config = {
            strategy = "flat",
            template_name = "journal_temp.norg"
          },
        },
        ["core.keybinds"] = {
          config = {
            hook = function (keybinds)
              keybinds.map("norg", "n", "<leader>c", "<cmd>Neorg return <CR>")
              keybinds.map("norg", "n", "<leader>nt", "<cmd>Neorg journal tommorow <CR>")
            end,
          }
        },
        ["core.qol.toc"] = {
          config = {
            close_after_use = true,
          },
        },
        ["core.qol.todo_items"] = {
          config = {
            order = {
              {
                "undone",
                " "
              },{
                "done",
                "x"
              }
            },
          },
        },
        ["core.integrations.telescope"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.concealer"] = {
          config = {
            icons = {
              todo = {
                done = {
                  icon = ''
                },
                undone = {
                  icon = '×'
                },
                pending = {
                  icon = ' '
                },
              }
            }
          }
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              secbrain = "~/dox/sec-brain"
            },
            default_workspace = "secbrain",
          },
        },
        ["core.summary"] = {},
      },
    }
    local neorg_callbacks = require("neorg.core.callbacks")

    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
      -- Map all the below keybinds only when the "norg" mode is active
      keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
          { "<C-f>", "core.integrations.telescope.find_linkable" },
          { "<C-h>", "core.integrations.telescope.search_headings" },
        },

        i = { -- Bind in insert mode
          { "<C-i>", "core.integrations.telescope.insert_link" },
        },
      }, {
          silent = true,
          noremap = true,
        })
    end)
    vim.keymap.set("n", "<leader>nb", ":Neorg workspace secbrain<cr>");
    vim.keymap.set("n", "<leader>nj", ":Neorg journal today<cr>");
    vim.keymap.set("n", "<leader>nm", ":Neorg inject-metadata<cr>")
  end,
}

