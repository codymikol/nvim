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
