return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()

    local float_preview = {
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.7,
        height = 0.55,

        prompt_position = "top",

        horizontal = {
          preview_width = 0.5,
        },
      },
      border = true,
    }

    local tb = require("telescope.builtin")
    
    vim.keymap.set("n", "grd", function()
      tb.lsp_definitions(float_preview)
    end, { desc = "Go to definition (float + preview)" })

    vim.keymap.set("n", "grD", function()
      tb.lsp_declarations(float_preview)
    end, { desc = "Go to declaration (float + preview)" })

    vim.keymap.set("n", "gri", function()
      tb.lsp_implementations(float_preview)
    end, { desc = "Go to implementation (float + preview)" })

    vim.keymap.set("n", "gry", function()
      tb.lsp_type_definitions(float_preview)
    end, { desc = "Go to type definition (float + preview)" })

    vim.keymap.set("n", "grr", function()
      tb.lsp_references(float_preview)
    end, { desc = "Go to references (float + preview)" })

    require('telescope').setup({})

  end,
}
