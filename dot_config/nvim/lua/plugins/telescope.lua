local actions = require("telescope.actions")

return {
  "telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = function(...)
            return actions.move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            return actions.move_selection_previous(...)
          end,
        },
      },
      n = {
        ["<C-j>"] = function(...)
          return actions.move_selection_next(...)
        end,
        ["<C-k>"] = function(...)
          return actions.move_selection_previous(...)
        end,
      },
    },
  },
}
