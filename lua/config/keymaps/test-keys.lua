return function(map)
  map("n", "<leader>tp", function()
    vim.cmd("w | PlenaryBustedFile %")
  end)

  map("n", "<leader>tn", function()
    vim.cmd("w | Neotest run")
  end)

  map("n", "<leader>ts", function()
    vim.cmd("w | Neotest summary")
  end)
end
