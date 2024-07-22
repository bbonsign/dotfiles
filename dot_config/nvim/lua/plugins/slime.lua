return {
  "jpalardy/vim-slime",
  init = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_no_mappings = 1
    -- https://github.com/jpalardy/vim-slime/blob/main/assets/doc/advanced.md#set-a-custom-default-config
    vim.g.slime_dont_ask_default = 1
    vim.g.slime_default_config = { socket_name = "default", target_pane = "right" }
  end,

  keys = {
    { "<C-c>", "<Plug>SlimeRegionSend", desc = "Slime region", mode = "x" },
    { "<C-c><C-c>", "<Plug>SlimeLineSend", desc = "Slime line" },
    { "<C-c>", "<Plug>SlimeMotionSend", desc = "Slime motion" },
    -- { "<C-c>v", "<cmd>SlimeConfig<CR>", desc = "Slime config" },
  },
}
