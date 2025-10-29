return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["S"] = function(state)
              local node = state.tree:get_node()
              if node.type == "directory" then
                local path = node:get_id()
                require("telescope.builtin").live_grep({ cwd = path })
              else
                vim.notify("Not a directory", vim.log.levels.WARN)
              end
            end,
          ["R"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            local ok, grug = pcall(require, "grug-far")
            if not ok then
              vim.notify("grug-far.nvim not found", vim.log.levels.ERROR)
              return
            end
            grug.open({ cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h") })
          end,
        },
      },
      filtered_items = {
        visible = true, -- This will make it so "hidden" files are shown, but in a different color
      },
    },
  },
}
