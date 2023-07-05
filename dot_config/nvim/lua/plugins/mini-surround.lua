-- https://www.lazyvim.org/configuration/recipes#change-surround-mappings
return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "s",
      delete = "ds",
      find = "",
      find_left = "",
      highlight = "",
      replace = "cs",
      update_n_lines = "",
    },
  },
}
