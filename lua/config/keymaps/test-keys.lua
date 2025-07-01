return function(map)
  map("n", "<leader>tp", function()
    vim.cmd("w | PlenaryBustedFile %")
  end)
end
