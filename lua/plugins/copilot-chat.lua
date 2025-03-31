return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      model = "gpt-4o-2024-11-20",
    },
  },
}
