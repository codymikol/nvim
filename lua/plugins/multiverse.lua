return {
  { "natecraddock/workspaces.nvim" },
  {
    dir = "~/dev/src/multiverse.nvim",
    -- "codymikol/multiverse.nvim",
    config = function()
      require("multiverse").setup({
        title = true,
        keymaps = {
          list = "<leader>ml",
          terminal = "<leader>mt",
          add = "<leader>ma",
          open = "<leader>mo",
          remove = "<leader>mr",
          log = "<leader>mL",
        }
      })
    end,
  },
}
