return function(map)
  map("n", "<leader>ml", function()
    vim.cmd("vsplit | terminal")
    vim.fn.feedkeys("log $(basename $(pwd))\n")
  end, { desc = "Log REST service" })
end
