return {
  "jpalardy/vim-slime",
  config = function()
    vim.cmd([[let g:slime_target = "tmux"]])
    vim.cmd([[let g:slime_bracketed_paste = 1]])
  end,

  keys = {
    { "<C-c>", "<Plug>SlimeMotionSend", desc = "Slime motion" },
    { "<C-c><C-c>", "<Plug>SlimeLineSend", desc = "Slime line" },
    { "<C-c>", "<Plug>SlimeRegionSend", desc = "Slime region", mode = "x" },
  },
}
