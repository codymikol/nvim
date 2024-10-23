-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--

local map = vim.keymap.set

-- Global File Search Ctrl + O
map("n", "<Space>gf", function()
  vim.cmd(":Telescope find_files")
end, { desc = "Globally search for files", silent = true })

-- Global Text Search Ctrl + F
map("n", "<Space>gt", function()
  vim.cmd(":Telescope live_grep")
end, { desc = "Globally search for text", silent = true })

-- Open Projects Window

map("n", "<Space>p", function()
  vim.cmd(":Telescope workspaces")
end)

map("n", "<leader>tp", function()
  vim.cmd("w | PlenaryBustedFile %")
end)

map("n", "<leader>tn", function()
  vim.cmd("w | Neotest run")
end)

map("n", "<leader>ts", function()
  vim.cmd("w | Neotest summary")
end)

vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- Disable docs on F1
vim.api.nvim_set_keymap("n", "<F1>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<F1>", "<Nop>", { noremap = true, silent = true })

-- Refactoring.nvim

vim.keymap.set("x", "<leader>re", function()
  require("refactoring").refactor("Extract Function")
end)
vim.keymap.set("x", "<leader>rf", function()
  require("refactoring").refactor("Extract Function To File")
end)
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function()
  require("refactoring").refactor("Extract Variable")
end)
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function()
  require("refactoring").refactor("Inline Function")
end)
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function()
  require("refactoring").refactor("Inline Variable")
end)
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function()
  require("refactoring").refactor("Extract Block")
end)
vim.keymap.set("n", "<leader>rbf", function()
  require("refactoring").refactor("Extract Block To File")
end)
-- Extract block supports only normal mode

-- Buffer Maps

map("n", "<leader>bo", function()
  -- write a function that will delete all buffers except the one open
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current_buf and vim.api.nvim_buf_get_option(buf, "buftype") == "" then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = "Close other buffers" })

-- LuaSnip maps

vim.api.nvim_set_keymap(
  "i",
  "<S-CR>",
  [[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "s",
  "<S-CR>",
  [[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
  { noremap = true, silent = true }
)

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

  vim.cmd('CopilotChatOpen')

  vim.schedule(function()
    chat.ask(visual, { system_prompt = prompt.prompt })
  end)

end

-- copilot maps
--

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
  vim.cmd('normal! gv')
  ask_chat_about_selection(prompts.Explain)
end, { desc = "Explain selection with Copilot" })

map("v", "<leader>cr", function()
  vim.cmd('normal! gv')
  ask_chat_about_selection(prompts.Review)
end, { desc = "Review selection with Copilot" })

map("v", "<leader>cf", function()
  vim.cmd('normal! gv')
  ask_chat_about_selection(prompts.Fix)
end, { desc = "Fix selection with Copilot" })

map("v", "<leader>cd", function()
  vim.cmd('normal! gv')
  ask_chat_about_selection(prompts.Documentation)
end, { desc = "Write Documentation for selection with Copilot" })
end



