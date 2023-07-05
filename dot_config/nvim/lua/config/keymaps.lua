-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- stylua: ignore start
-- toggle options
-- Taken from the default <leader>u prefixed keymaps, to also have <leader>t versions
map("n", "<leader>tf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
map("n", "<leader>ts", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>tw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>tl", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
map("n", "<leader>td", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })

local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>tc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

if vim.lsp.inlay_hint then
  map("n", "<leader>th", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })
end
-- stylua: ignore end
