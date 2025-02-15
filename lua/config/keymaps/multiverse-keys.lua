return function(map)

  -- Open Projects Window
  map("n", "<Space>p", function()
    vim.cmd(":Telescope workspaces")
  end)

end
