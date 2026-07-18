return {
  nil_ls = {
    settings = {
      ["nil"] = {
        formatting = {
          command = { "nixfmt" },
        },
      },
    },
  },
  yamlls = {
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
        },
        validate = true,
        completion = true,
        hover = true,
      },
    },
  },
  terraform_lsp = {},
  gopls = {},
  tsserver = {},
  denols = {},
  rust_analyzer = {},
  volar = {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    init_options = {
      vue = {
        hybridMode = false,
      },
    },
  },
}
