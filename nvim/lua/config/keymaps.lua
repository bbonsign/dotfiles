-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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

vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "<Leader>l")
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
-- vim.keymap.del("n", "<A-h>")
-- vim.keymap.del("n", "<A-j>")
-- vim.keymap.del("n", "<A-k>")
-- vim.keymap.del("n", "<A-l>")

-- Overrides <C-I> too
-- map("n", "<Tab>", "za", { desc = "Toggle Fold" })

map("n", "<Leader>.", "<cmd>Telescope buffers<cr>", { desc = "Disabled" })

map("n", "<Leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Use the blackhole register "_ by default for x
map({ "n", "v" }, "x", '"_x')

-- To complement the default <C-y> for scrolling text up/down
-- with out moving cursor
map("n", "<C-h>", "<C-e>")
map("n", "<C-j>", "<C-e>")
map("n", "<C-k>", "<C-y>")

-- Center line when jumping to search results
map("n", "n", "nzz")
map("n", "N", "Nzz")

map({ "n", "v" }, "g.", "g`.", { desc = "Goto last edit" })

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
map({ "n", "x" }, "<CR>", "*N", { desc = "Search word under cursor" })

map("n", "Q", "@q", { desc = 'Macro in "q' })
map("v", "Q", [[:norm @q<CR>]], { desc = 'Macro in "q' })

map("i", [[<C-\>]], "λ", { desc = "Insert λ characer" })
-- map("i", [[<C-j>]], "|>", { desc = "|> Pipe" })

map("i", "<C-e>", "<Esc>A", { desc = "End of line" })
map("i", "<C-a>", "<Esc>I", { desc = "Beg of line" })
map("i", "<C-b>", "<Left>", { desc = "Left" })
map("i", "<C-f>", "<Right>", { desc = "Right" })
map("n", "<C-e>", "$", { desc = "End of line" })
map("n", "<C-a>", "^", { desc = "Beg of line" })
map("v", "<C-e>", "g_", { desc = "End of line" })
map("v", "<C-a>", "^", { desc = "Beg of line" })
map("c", "<C-e>", "<End>", { desc = "End of line" })
map("c", "<C-a>", "<Home>", { desc = "Beg of line" })
map("c", "<C-b>", "<Left>", { desc = "Left" })
map("c", "<C-f>", "<Right>", { desc = "Right" })

map("n", "<Leader>sk", ":FzfLua keymaps<CR>", { desc = "Search Keymaps" })

-- toggle options
-- map("n", "<Leader>tc", ":set cursorline!<CR>", { desc = "Toggle cursorline" })
map("n", "<Leader>uc", ":set cursorline!<CR>", { desc = "Toggle cursorline" })

Snacks.toggle
  .option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline", global = true })
  :map("<leader>ut")

Snacks.toggle({
  name = "Statusline",
  get = function()
    return vim.o.laststatus == 3
  end,
  set = function(state)
    vim.o.laststatus = state and 3 or 0
  end,
}):map("<leader>uS")

map("n", "<Leader>a:", "A;<Esc>", { desc = "Append ; to line" })

map("n", "<Leader>bb", ":Telescope buffers<CR>", { desc = "Telescope buffers" })

map("n", "<Leader>fs", ":w<CR>", { desc = "Write file" })
map("n", "<Leader>fw", ":w<CR>", { desc = "Write file" })
map("n", "<Leader>fR", ":earlier 1f<CR>", { desc = "Revert to last write" })

map("n", "<Leader>w=", "<C-w>=", { desc = "Balance splits" })
map("n", "<Leader>wc", "<C-w>c", { desc = "Close window" })
map("n", "<Leader>wH", "<C-w>H", { desc = "Move left" })
map("n", "<Leader>wh", "<C-w>h", { desc = "Change left" })
map("n", "<Leader>wJ", "<C-w>J", { desc = "Move down" })
map("n", "<Leader>wj", "<C-w>j", { desc = "Change down" })
map("n", "<Leader>wK", "<C-w>K", { desc = "Move up" })
map("n", "<Leader>wk", "<C-w>k", { desc = "Change up" })
map("n", "<Leader>wL", "<C-w>L", { desc = "Move right" })
map("n", "<Leader>wl", "<C-w>l", { desc = "Change right" })
map("n", "<Leader>wo", "<C-w>o", { desc = "Only window" })
map("n", "<Leader>wq", "<C-w>c", { desc = "Close window" })
map("n", "<Leader>wR", "<C-w>R", { desc = "Rotate windows <-" })
map("n", "<Leader>wr", "<C-w>r", { desc = "Rotate windows ->" })
map("n", "<Leader>ws", ":split<CR>", { desc = "Horizontal split" })
map("n", "<Leader>wt", ":tab split<CR>", { desc = "New tab w/ current buf" })
map("n", "<Leader>wv", ":vsplit<CR>", { desc = "Veritcal split" })
map("n", "<Leader>wW", "<C-w>W", { desc = "Other window <-" })
map("n", "<Leader>ww", "<C-w>w", { desc = "Other window ->" })

-- https://github.com/nvzone/menu
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default", { border = true })
end, {})

vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec('"normal! \\<RightMouse>"')

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true, border = true })
end, {})

vim.cmd([[cabbr Wa wa]])
vim.cmd([[cabbr Wq wq]])
