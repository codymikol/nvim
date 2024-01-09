-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

-- Global File Search Cmd + Shift + O
map("n", "<C-S-O>", function()
  vim.cmd(":Telescope find_files")
end, { desc = "Globally search for files", silent = true })

-- Global Text Search Cmd + Shift + F
map("n", "<C-S-F>", function()
  vim.cmd(":Telescope live_grep")
end, { desc = "Globally search for text", silent = true })
