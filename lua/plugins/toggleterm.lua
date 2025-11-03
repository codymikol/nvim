return {
  "akinsho/toggleterm.nvim",
  opts = function(_, opts)
    -- default direction
    opts.direction = "float"

    -- dynamic float options
    opts.float_opts = {
      border = "rounded",
      width = function()
        return math.floor(vim.o.columns * 0.8)
      end,
      height = function()
        return math.floor(vim.o.lines * 0.8)
      end,
    }

    -- re-center and resize floating terminals on VimResized
    vim.api.nvim_create_autocmd("VimResized", {
      callback = function()
        local terminals = require("toggleterm.terminal").get_all()
        for _, term in pairs(terminals) do
          if term:is_float() and term.window and vim.api.nvim_win_is_valid(term.window) then
            term:close()
            term:open() -- reopen with updated size
          end
        end
      end,
    })

    return opts
  end,
}
