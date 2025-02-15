return function(map)

  -- Global File Search Ctrl + O
  map("n", "<Space>gf", function()
    vim.cmd(":FzfLua files")
  end, { desc = "Globally search for files", silent = true })

  -- Global Text Search Ctrl + F
  map("n", "<Space>gt", function()
    vim.cmd(":FzfLua grep_visual")
  end, { desc = "Globally search for text", silent = true })

end
