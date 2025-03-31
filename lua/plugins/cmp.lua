return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    opts.mapping = {
      -- <Tab> confirms the selection and replaces what is in front of the cursor
      ["<Tab>"] = cmp.mapping(function(fallback)

        vim.notify("Tab pressed")

        if cmp.visible() then
          cmp.confirm({ select = true, replace = true }) -- Confirms the current selection and replaces what is in front
        elseif luasnip.locally_jumpable(1) then
          luasnip.jump(1) -- Jump forward in snippet
        else
          fallback() -- Fallback behavior (default action)
        end
      end, { "i", "s" }),

      -- <CR> confirms the selection and prepends it to what is in front of the cursor
      ["<CR>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm({ select = true, prepend = true }) -- Confirms the selection and prepends it to what is in front
        else
          fallback() -- Fallback behavior (default action)
        end
      end, { "i", "s" }),
    }

  end,
}
