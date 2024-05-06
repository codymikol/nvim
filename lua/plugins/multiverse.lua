return {
  { "natecraddock/workspaces.nvim" },
  {
    dir = "~/dev/src/multiverse.nvim",
    -- "codymikol/multiverse.nvim",
    config = function()
      require("multiverse").setup()
    end,
  },
}
