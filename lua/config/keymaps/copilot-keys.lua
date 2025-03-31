return function(map)
  vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
  })
  vim.g.copilot_no_tab_map = true

  -- copilot maps

  local prompts = require("CopilotChat").config.prompts
  if prompts == nil then
    vim.notify("Error configuring keymaps for CopilotChat, prompts could not be found...")
  else
    map("n", "<leader>cc", function()
      vim.cmd("CopilotChatToggle")
    end, { desc = "Toggle Copilot Chat" })

    map("n", "<leader>cga", function()
      vim.cmd("CopilotChatCommit")
    end, { desc = "Write Commit Message for all changes with Copilot" })

    map("n", "<leader>cgs", function()
      vim.cmd("CopilotChatCommitStaged")
    end, { desc = "Write Commit Message for staged changes with Copilot" })

    map("v", "<leader>ce", function()
      vim.cmd("CopilotChatExplain")
    end, { desc = "Explain selection with Copilot" })

    map("v", "<leader>cr", function()
      vim.cmd("CopilotChatReview")
    end, { desc = "Review selection with Copilot" })

    map("v", "<leader>cf", function()
      vim.cmd("CopilotChatFix")
    end, { desc = "Fix selection with Copilot" })

    map("v", "<leader>cd", function()
      vim.cmd("CopilotChatDocs")
    end, { desc = "Write Documentation for selection with Copilot" })
  end
end
