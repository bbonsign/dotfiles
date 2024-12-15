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
        preset = { header = logo },
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
    },
  },
}
