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

-- workaround https://github.com/folke/snacks.nvim/issues/419
  vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
     for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  if vim.bo[buf].buftype == "terminal" then
    vim.api.nvim_buf_delete(buf, {force = true})
  end
end
    end,
  })
