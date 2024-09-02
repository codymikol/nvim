return {
  {
  "neovim/nvim-lspconfig",
  config = function()
    print("heating up")
    local busted_types_path = vim.fn.expand("./types/busted.lua")

    local runtime_files = vim.api.nvim_get_runtime_file("", true)

    local global_namespaces = { 'vim', 'describe', 'it', 'before_each', 'after_each', 'setup', 'teardown', 'pending' }

    table.insert(runtime_files, busted_types_path)

    require 'lspconfig'.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT', -- or 'Lua 5.1', 'Lua 5.2', etc.
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
    }
    require 'lspconfig'.nil_ls.setup {}
    require 'lspconfig'.terraform_lsp.setup {}
  end
  }
}
