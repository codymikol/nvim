return function(map)
  map("n", "<leader>bo", function()
    local manager_ok, manager = pcall(require, "neo-tree.sources.manager")
    local was_open = false

    -- close neo-tree first so it's not a window at all during the loop
    vim.cmd("Neotree close")

    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= current_buf and vim.fn.buflisted(buf) == 1 then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end

    -- reopen it
    vim.cmd("Neotree show")
  end, { desc = "Close other buffers" })
end
