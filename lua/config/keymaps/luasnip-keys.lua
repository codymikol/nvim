return function(map)
  -- LuaSnip maps

  vim.api.nvim_set_keymap(
    "i",
    "<S-CR>",
    [[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "s",
    "<S-CR>",
    [[<cmd>lua require('luasnip').expand_or_jump()<CR>]],
    { noremap = true, silent = true }
  )
end
