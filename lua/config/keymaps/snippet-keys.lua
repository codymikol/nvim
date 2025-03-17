
local function generate_uuid()
  local random = math.random
  local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
  return string.gsub(template, '[xy]', function (c)
    local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
    return string.format('%x', v)
  end)
end

-- Function to insert UUID at cursor in insert mode
local function insert_uuid()
  local uuid = generate_uuid()
  vim.api.nvim_put({uuid}, 'c', true, true)
end


return function(map)

  map("n", "<leader>iu", function()
    insert_uuid()
  end, { desc = "Insert a random UUID V4 at the cursor", silent = true })

end

