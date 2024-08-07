return {
  "stevearc/oil.nvim",
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    use_default_keymaps = false,
    columns = {
      "icon",
      -- "permissions",
      "size",
      -- "mtime",
    },
    keymaps = {
      ["?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      l = "actions.select",
      ["<C-v>"] = "actions.select_vsplit",
      ["<C-s>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      q = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["g."] = "actions.toggle_hidden",
      ["<leader>:"] = {
        "actions.open_cmdline",
        opts = {
          shorten_path = true,
          modify = ":h",
        },
        desc = "Open the command line with the current directory as an argument",
      },
    },
    preview = {
      win_options = {
        winblend = 50,
      },
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
    vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
  end,
}
