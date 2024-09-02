return {
  "LazyVim/LazyVim",
  opts = {
    colorscheme = function ()
      require("catppuccin").setup({
        flavour = "frappe",
      })
      vim.cmd("colorscheme catppuccin")
    end
  }
}
