-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("User", {
  pattern = "NeotestFinished",
  callback = function()
    vim.notify("Neotest finished running tests", vim.log.levels.INFO, {
      title = "Neotest",
      icon = "���",
    })
    vim.cmd("redraw")
  end,
})
