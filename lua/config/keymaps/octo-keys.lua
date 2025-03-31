
return function(map)

  -- Open Projects Window
  map("n", "<Space>gpc", function()
    vim.cmd(":Octo pr create")
  end, { desc = "Create a new pull request" })

  map("n", "<Space>gpb", function()
    vim.cmd(":Octo pr browser")
  end, { desc = "Open the current pull request in a browser" })

  map("n", "<Space>gpd", function()
    vim.cmd(":Octo pr diff")
  end, { desc = "Show a diff of the current pull request" })

end
