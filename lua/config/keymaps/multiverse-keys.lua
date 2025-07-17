return function(map)

  -- Open Projects Window
  map("n", "<Space>p", function()
    vim.cmd(":MultiverseList")
  end)

end
