return function(map)
  -- Buffer Maps

  map("n", "<leader>bo", function()
    -- write a function that will delete all buffers except the one open
    local current_buf = vim.api.nvim_get_current_buf()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if buf ~= current_buf and vim.api.nvim_buf_get_option(buf, "buftype") == "" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end, { desc = "Close other buffers" })
end
