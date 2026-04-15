return {
  "nvim-neotest/neotest",
  -- dir = "~/dev/src/neotest",
  dependencies = {
    -- { dir = "~/dev/src/neotest-kotest" },
    "codymikol/neotest-kotlin.nvim",
    "nvim-neotest/nvim-nio",
    {
      "fredrikaverpil/neotest-golang",
      version = "*",
      build = function()
        vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
      end,
    },
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "nvim-treesitter/nvim-treesitter", -- Optional, but recommended
      branch = "main", -- NOTE; not the master branch!
      build = function()
        vim.cmd([[:TSUpdate go]])
      end,
    },
  },
  config = function()
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
    })

    local goconfig = { runner = "gotestsum" }

    require("neotest").setup({
      output = {
        enabled = true,
        open_on_run = "short",
      },
      adapters = {
        require("neotest-kotlin"),
        require("neotest-golang")(goconfig),
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
