return {
  "folke/noice.nvim",
  presets = {
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },

  opts = {
    lsp = {
      hover = {
        silent = true,
        opts = {
          border = {
            padding = { 0, 1 },
            style = "rounded",
          },
        },
      },

      documentation = {
        opts = {
          border = {
            padding = { 0, 1 },
            style = "rounded",
          },
        },
      },
    },
  },
}
