return function(map)
  vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false,
  })
  vim.g.copilot_no_tab_map = true

  local function get_visual_selection()
    -- Get the start and end positions of the visual selection
    local start_pos = vim.fn.getpos("'<")
    local end_pos = vim.fn.getpos("'>")

    -- Extract the lines within the selection
    local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)

    -- If the selection is within a single line, extract the substring
    if #lines == 1 then
      lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
    else
      -- For multi-line selection, adjust the start and end lines
      lines[1] = string.sub(lines[1], start_pos[3])
      lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
    end

    -- Concatenate the lines into a single string
    return table.concat(lines, "\n")
  end

  local function ask_chat_about_selection(prompt)
    local chat = require("CopilotChat")

    local visual = get_visual_selection()

    vim.cmd("CopilotChatOpen")

    vim.schedule(function()
      chat.ask(visual, { system_prompt = prompt.prompt })
    end)
  end

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
      vim.cmd("normal! gv")
      ask_chat_about_selection(prompts.Explain)
    end, { desc = "Explain selection with Copilot" })

    map("v", "<leader>cr", function()
      vim.cmd("normal! gv")
      ask_chat_about_selection(prompts.Review)
    end, { desc = "Review selection with Copilot" })

    map("v", "<leader>cf", function()
      vim.cmd("normal! gv")
      ask_chat_about_selection(prompts.Fix)
    end, { desc = "Fix selection with Copilot" })

    map("v", "<leader>cd", function()
      vim.cmd("normal! gv")
      ask_chat_about_selection(prompts.Documentation)
    end, { desc = "Write Documentation for selection with Copilot" })
  end
end
