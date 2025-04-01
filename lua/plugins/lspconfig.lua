return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      servers = {
        nil_ls = {},
        kotlin_language_server = {},
        terraform_lsp = {},
        gopls = {},
        tsserver = {},
        volar = {
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
        }
      }
    },
    config = function(_, opts)
      local busted_types_path = vim.fn.expand("./types/busted.lua")

      local runtime_files = vim.api.nvim_get_runtime_file("", true)

      local global_namespaces = { "vim", "describe", "it", "before_each", "after_each", "setup", "teardown", "pending" }

      table.insert(runtime_files, busted_types_path)

      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT", -- or 'Lua 5.1', 'Lua 5.2', etc.
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- This adds autocompletion from blink.nvim to all of our LSP server configurations :)
      local lspconfig = require('lspconfig')

      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        if nil ~= lspconfig[server].setup then
          lspconfig[server].setup(config)
        else
          vim.notify("LSP server " .. server .. " not found")
        end
      end

    end,
  },
}
