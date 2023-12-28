return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        header = {
          "                         ___                     ",
          " _____ _                |  _|    _               ",
          "|  _  | |_ _____ ___ ___| |  ___| |_ ___ ___ ___ ",
          "|     |  _|     | . |_ -| | | . |   | -_|  _| -_|",
          "|__|__|_| |_|_|_|___|___| |_|  _|_|_|___|_| |___|",
        },
      },
    })
  end,
  requires = { "nvim-tree/nvim-web-devicons" },
}
