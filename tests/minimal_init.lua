local repo_root = vim.fn.getcwd()
local plenary_path = vim.env.PLENARY_PATH or (repo_root .. "/../plenary.nvim")

vim.opt.rtp:append(repo_root)
vim.opt.rtp:append(plenary_path)

package.path = table.concat({
  repo_root .. "/lua/?.lua",
  repo_root .. "/lua/?/init.lua",
  plenary_path .. "/lua/?.lua",
  plenary_path .. "/lua/?/init.lua",
  package.path,
}, ";")

vim.cmd("runtime plugin/plenary.vim")
