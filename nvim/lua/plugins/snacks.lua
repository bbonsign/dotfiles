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
      dashboard = {
        enabled = true,
        preset = {
          pick = function(cmd, opts)
            return require("telescope.builtin")[cmd == "files" and "find_files" or cmd](opts)
          end,
          header = logo,
        },
      },
      animate = { enabled = false },
      scoll = { enabled = false },
      indent = { enabled = false },
    },
    keys = {
      {
        "<leader>d",
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
        "<leader>tn",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss all Notifications",
      },
      {
        "<leader><BS>",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss all Notifications",
      },
    },
  },
}
