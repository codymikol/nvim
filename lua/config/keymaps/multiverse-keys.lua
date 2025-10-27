return function(map)

  -- Open Projects Window
  map("n", "<Space>p", function()
    vim.cmd(":MultiverseList")
  end)

  map("n", "<Space>mm", function()
    vim.cmd(":MultiverseList")
  end)

  -- Log debuggy stuff
  map("n", "<space>md", function()
    local log_file = require("multiverse.log").get_log_file()
    vim.cmd("split | terminal")
    vim.notify("opening logging for: " .. log_file)
    vim.fn.chansend(vim.b.terminal_job_id, "tail -f " .. log_file .. "\n")
  end)

end
