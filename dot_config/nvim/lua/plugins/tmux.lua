return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.cmd([[let g:tmux_navigator_no_mappings = 1]])
    vim.cmd([[let  g:tmux_navigator_no_wrap = 1]])
    -- vim.keymap.set("n", "<A-h>", ":TmuxNavigateLeft<CR>", { desc = "TmuxLeft" })
    -- vim.keymap.set("n", "<A-j>", ":TmuxNavigateDown<CR>", { desc = "TmuxDown" })
    -- vim.keymap.set("n", "<A-k>", ":TmuxNavigateUp<CR>", { desc = "TmuxUp" })
    -- vim.keymap.set("n", "<A-l>", ":TmuxNavigateRight<CR>", { desc = "TmuxRight" })
    vim.keymap.del("n", "<C-h>")
    vim.keymap.del("n", "<C-j>")
    vim.keymap.del("n", "<C-k>")
    vim.keymap.del("n", "<C-l>")
  end,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<A-h>", ":TmuxNavigateLeft<CR>" },
    { "<A-j>", ":TmuxNavigateDown<CR>" },
    { "<A-k>", ":TmuxNavigateUp<CR>" },
    { "<A-l>", ":TmuxNavigateRight<CR>" },
    -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
