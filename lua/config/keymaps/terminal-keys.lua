return function (map)
  
  map("n", "<C-_>", function()
    vim.cmd('ToggleTerm')
  end, { desc = "Open a floating terminal", noremap = true, silent = true })

  map("n", "<leader>ft", function()
    vim.cmd('ToggleTerm')
  end, { desc = "Open a floating terminal", noremap = true, silent = true })

end
