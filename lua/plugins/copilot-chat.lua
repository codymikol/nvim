return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
    window = {
      layout = 'float',
      width = 0.8, -- Fixed width in columns
      height = 0.8, -- Fixed height in rows
      border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
      title = '� AI Assistant',
      zindex = 100, -- Ensure window stays on top
    },

    headers = {
      user = '🫠🧠 Cody The Human',
      assistant = '👹 Lying Machine 9001',
      tool = '🪓 Tool',
    },

    separator = '━━',
    auto_fold = true, -- Automatically folds non-assistant messages
    -- model = "gpt-4o-2024-11-20",
    },
    dependencies = {
      { "github/copilot.vim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    config = function(_, opts)
      require("CopilotChat").setup(opts)
      vim.api.nvim_exec_autocmds("User", { pattern = "CopilotChatLoaded" }) -- This is for my chat alias...
    end,
  },
}
