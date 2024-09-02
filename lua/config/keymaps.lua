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

vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- Disable docs on F1
vim.api.nvim_set_keymap('n', '<F1>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<F1>', '<Nop>', { noremap = true, silent = true })

-- Refactoring.nvim

vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)
vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end)
-- Extract block supports only normal mode

-- Buffer Maps

map("n", "<leader>bo", function ()
  -- write a function that will delete all buffers except the one open
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current_buf and vim.api.nvim_buf_get_option(buf, 'buftype') == '' then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = "Close other buffers" })
