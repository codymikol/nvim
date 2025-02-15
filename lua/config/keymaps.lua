-- All lua files under the config/keymaps directory will be imported as a function and executed with the map function as an argument

local keymapGlob = vim.fn.glob("~/.config/nvim/lua/config/keymaps/*.lua", false, false)

local keymaps = vim.split(keymapGlob, "\n", { trailing = true })

for _, keymap in ipairs(keymaps) do
  local keymapName = keymap:match("([^/]+).lua$")
  local keymapModule = require("config.keymaps." .. keymapName)
  
  xpcall(function()
    keymapModule(vim.keymap.set)
  end, function(err)
    vim.notify("Error loading config/keymap " .. keymapName .. ": " .. err)
  end)

end
