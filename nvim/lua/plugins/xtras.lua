return {
  -- Search for nerd font icons
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },

  {
    "nvzone/menu",
    lazy = true,
    dependencies = { "nvzone/volt" },
  },
  --  Color picker
  {
    "nvzone/minty",
    enabled = false,
    lazy = true,
    cmd = { "Shades", "Huefy" },
    dependencies = { "nvzone/volt" },
    opts = {
      huefy = {
        border = true,
      },

      shades = {
        border = true,
      },
    },
  },
}
