return {
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   opts = {
  --     mapping = require("cmp").mapping.preset.insert({
  --       ["<TAB>"] = require("cmp").mapping.confirm({
  --         select = false,
  --         behavior = require("cmp").ConfirmBehavior.Replace,
  --       }),
  --     }),
  --   },
  -- },
}
