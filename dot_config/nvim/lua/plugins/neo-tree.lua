return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = false,
    window = {
      position = "right",
      mappings = {
        ["h"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        ["<Left>"] = function(state)
          local node = state.tree:get_node()
          if node.type == "directory" and node:is_expanded() then
            require("neo-tree.sources.filesystem").toggle_directory(state, node)
          else
            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
          end
        end,
        ["l"] = "open",
        ["<Right>"] = "open",
        ["p"] = { "toggle_preview", config = { use_float = true } },
      },
    },
  },
}
