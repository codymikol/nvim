-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
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
