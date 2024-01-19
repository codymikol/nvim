return {
  { "natecraddock/workspaces.nvim" },
  {
    "codymikol/multiverse.nvim",
    config = function()
      require("multiverse").setup()
    end,
  },
}
