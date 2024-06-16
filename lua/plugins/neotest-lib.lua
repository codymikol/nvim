return {
  "nvim-neotest/neotest",
  dependencies = {
    { dir = "~/dev/src/neotest-kotest.nvim" },
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- "codymikol/neotest-kotest.nvim",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-kotest"),
      },
    })
  end,
}
