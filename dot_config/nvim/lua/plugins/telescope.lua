local actions = require("telescope.actions")

return {
  "telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    {
      "benfowler/telescope-luasnip.nvim",
      config = function()
        require("telescope").load_extension("luasnip")
      end,
    },
  },
  keys = {
    -- add a keymap to browse plugin files
    {
      "<leader>sP",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "find plugin file",
    },
    {
      "<leader>s/",
      ":Telescope<CR>",
      desc = "find plugin file",
    },
    {
      "<leader>'",
      ":Telescope resume<CR>",
      desc = "Telescope resume",
    },
  },

  opts = {
    defaults = {
      winblend = 5,
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
