return function(map)
  -- Disable docs on F1
  vim.api.nvim_set_keymap("n", "<F1>", "<Nop>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("i", "<F1>", "<Nop>", { noremap = true, silent = true })
end
