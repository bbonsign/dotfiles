local logo = [[
                 _)
 __ \   _ \  _ \\ \   / | __ `__ \
 |   |  __/ (   |\ \ /  | |   |   |
_|  _|\___|\___/  \_/  _|_|  _|  _|
]]

return {
  {
    "folke/snacks.nvim",
    -- priority = 1000,
    -- lazy = false,
    opts = {
      styles = {
        blame_line = {
          width = 0.9,
          height = 0.6,
          border = "rounded",
          title = " Git Blame ",
          title_pos = "center",
          ft = "git",
        },
      },
      animate = { enabled = false },
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = logo,
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "󰝒 ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = "󰠮 ", key = "S", desc = "Scrach Buffers", action = ":lua Snacks.scratch.select()" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
      debug = { enabled = true },
      git = { enabled = true },
      indent = { enabled = false },
      lazygit = { enabled = true },
      scoll = { enabled = false },
      toggle = { enabled = true },
      picker = require("bb.snacks_picker"),
    },

    keys = {
      {
        "<Leader>.",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "<Leader>:",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        '<Leader>"',
        function()
          Snacks.picker.registers()
        end,
        desc = "Registers",
      },
      {
        "<Leader>'",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        "<Leader>-",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader><BS>",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss all Notifications",
      },
      {
        "<leader>D",
        function()
          Snacks.dashboard()
        end,
        desc = "Dashboard",
      },
      {
        "<leader>gb",
        function()
          Snacks.picker.git_status()()
        end,
        desc = "Blame Line",
      },
      {
        "<leader>gB",
        function()
          Snacks.git.blame_line()
        end,
        desc = "Blame Line",
      },
      {
        "<leader>gL",
        function()
          Snacks.lazygit.log_file()
        end,
        desc = "Lazygit Log File",
      },
      {
        "<leader>sp",
        function()
          Snacks.picker()
        end,
        desc = "Pickers",
      },
      {
        "<leader>sP",
        function()
          Snacks.picker.lazy()
        end,
        desc = "Search for Plugin Spec",
      },
      {
        "<Leader>sr",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        "<leader>uC",
        "<nop>",
        desc = "Disabled",
      },
      {
        "<leader>ud",
        function()
          Snacks.dashboard()
        end,
        desc = "Dashboard",
      },
    },

    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end
          vim.print = _G.dd -- Override print to use snacks for `:=` command

          -- toggle options
          Snacks.toggle
            .option(
              "showtabline",
              { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline", global = true }
            )
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
        end,
      })
    end,
  },
}
