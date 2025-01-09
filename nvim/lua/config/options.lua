-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.VM_leader = ";" -- for "mg979/vim-visual-multi" in plugins/multicursors.lua
vim.g.maplocalleader = ";"

opt.relativenumber = false
opt.number = false
opt.conceallevel = 0

opt.cmdheight = 0

vim.g.snacks_animate = false

-- In case you don't want to use `:LazyExtras`,
-- then you need to set the option below.
vim.g.lazyvim_picker = "telescope" -- or "fzf"

-- set to `true` to follow the main branch
-- you need to have a working rust toolchain to build the plugin
-- in this case.
-- vim.g.lazyvim_blink_main = true
