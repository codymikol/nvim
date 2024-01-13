-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

-- Global File Search Cmd + O
map("n", "<C-O>", function()
  vim.cmd(":Telescope find_files")
end, { desc = "Globally search for files", silent = true })

-- Global Text Search Cmd + F
map("n", "<C-F>", function()
  vim.cmd(":Telescope live_grep")
end, { desc = "Globally search for text", silent = true })
