return {
  "nvim-neotest/neotest",
    -- dir = "~/dev/src/neotest",
    dependencies = {
      { dir = "~/dev/src/neotest-kotest" },
      --"codymikol/neotest-kotest.nvim",
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-go",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-kotlin"),
          require("neotest-go")({
            recursive_run = true
          }),
        },
      })

      vim.api.nvim_create_autocmd("User", {
      pattern = "NeotestFinished",
      callback = function()
        -- schedule it in case we’re still in a libuv callback
        vim.schedule(function()
          vim.cmd.redraw()
        end)
      end,
    })
    end,
}
