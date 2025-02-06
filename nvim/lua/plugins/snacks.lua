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
          pick = function(cmd, opts)
            return require("telescope.builtin")[cmd == "files" and "find_files" or cmd](opts)
          end,
          header = logo,
        },
      },
      debug = { enabled = true },
      git = { enabled = true },
      indent = { enabled = false },
      lazygit = { enabled = true },
      scoll = { enabled = false },
      toggle = { enabled = true },
    },
    keys = {
      {
        "<leader>D",
        function()
          Snacks.dashboard()
        end,
        desc = "Dashboard",
      },
      {
        "<leader>ud",
        function()
          Snacks.dashboard()
        end,
        desc = "Dashboard",
      },
      {
        "<leader><BS>",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss all Notifications",
      },
      {
        "<leader>gb",
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
    },
  },
}
