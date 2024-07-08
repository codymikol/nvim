return {
  -- "nvim-neotest/neotest",
  { 
    dir = "~/dev/src/neotest",
    dependencies = {
    { dir = "~/dev/src/neotest-kotest" },
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
}
