return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    vim.notify(vim.inspect(opts))

    local cmp = require("cmp")
    local luasnip = require("luasnip")

    vim.notify("CR")

    opts.mapping["<CR>"] = cmp.mapping(function(fallback)
      if luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      elseif cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end)

    opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
      vim.notify("TABBIN")
      if luasnip.locally_jumpable(1) then
        vim.notify("locally jumpable!")
        luasnip.jump(1)
      elseif cmp.visible() then
        vim.notify("cmp selectable")
        cmp.select_next_item()
      else
        vim.notify("fallback")
        fallback()
      end
    end, { "i", "s" })

    opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
      vim.notify("S-Tab")
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" })
  end,
}
