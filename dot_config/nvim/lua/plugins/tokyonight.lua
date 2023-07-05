-- https://www.lazyvim.org/configuration/recipes#make-tokyonight-transparent
return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      style = "night",
      sidebars = "transparent",
      -- floats = "transparent",
    },
  },
}
