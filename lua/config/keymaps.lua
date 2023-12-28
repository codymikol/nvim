-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local map = vim.keymap.set

-- Global Text Search Cmd + Shift + F

map("n", "<CSF>", function()
  vim.cmd(":Telescope find_files")
end, { desc = "Globally search for text", noremap = true, silent = true })
