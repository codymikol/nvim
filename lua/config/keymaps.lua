-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

-- Global File Search Ctrl + O
map("n", "<C-O>", function()
  vim.cmd(":Telescope find_files")
end, { desc = "Globally search for files", silent = true })

-- Global Text Search Ctrl + F
map("n", "<C-F>", function()
  vim.cmd(":Telescope live_grep")
end, { desc = "Globally search for text", silent = true })

-- Open Projects Window

map("n", "<C-P>", function()
  vim.cmd(":Telescope workspaces")
end)

-- Close current tab, or more specifically, go to the next buffer and close the previous.

map("n", "<C-c>", function()
  vim.cmd(":w")
  --TODO: this cannot close buffers that are not writeable.
  vim.cmd(":bnext | bdelete #")
end)

map("n", "<C-x>", function()
  vim.cmd(":wa")
  vim.cmd(":qa!")
end)
