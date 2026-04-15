return function(map)
  map("n", "<leader>tp", function()
    vim.cmd("w | PlenaryBustedFile %")
  end, { desc = "Run plenary on current file" })

  map("n", "<leader>tr", function()
    require("neotest").run.run()
  end, { desc = "Run neotest on nearest testcase" })

  map("n", "<leader>ts", function()
    require("neotest").summary.open()
  end, { desc = "Show neotest summary" })
end
