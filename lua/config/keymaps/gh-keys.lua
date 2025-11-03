  return function(map)
    map("n", "<leader>gi", function() require('snacks').picker.gh_issue() end, { desc = "GitHub Issues (open)" })
    map("n", "<leader>gI", function() require('snacks').picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" })
    map("n", "<leader>gp", function() require('snacks').picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
    map("n", "<leader>gP", function() require('snacks').picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" })
  end
