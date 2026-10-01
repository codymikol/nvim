return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        show = true,
        fixbuf = true,
        relative = "editor",
        position = "float",
        minimal = true,
        wo = {
          winhighlight = "Normal:SnacksNormal,NormalNC:SnacksNormalNC,WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC,FloatTitle:SnacksTitle,FloatFooter:SnacksFooter,WinSeparator:SnacksWinSeparator",
        },
        bo = {},
        title_pos = "center",
        keys = {
          q = "close",
        },
        footer_pos = "center",
        footer_keys = false,
      }
    },
    gh = {},
        picker = {
      sources = {
        gh_issue = {
          -- your gh_issue picker configuration comes here
          -- or leave it empty to use the default settings
        },
        gh_pr = {
          -- your gh_pr picker configuration comes here
          -- or leave it empty to use the default settings
        }
      }
    },
    dashboard = {
      sections = {
        { section = "header" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "p", desc = "Projects", action = function() vim.cmd("MultiverseList") end },
        { padding = 2 },
        function()
          local multiverse_dashboard = require("config.multiverse_dashboard")
          local multiverse_repository = require("multiverse.repositories.multiverse_repository")
          local multiverse_manager = require("multiverse.managers.multiverse_manager")

          local open = function(universe_summary)
            multiverse_manager.load_universe(multiverse_repository.getMultiverse(), universe_summary)
          end

          local recent = multiverse_dashboard.most_recent(multiverse_repository.getMultiverse().universes, 5)
          local items = multiverse_dashboard.dashboard_keys(recent, open)

          items.gap = 1
          items.padding = 1

          return items
        end,
        { section = "startup" },
      },
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        header = [[ _                                           _               
| |__  _   _  __ _   ___ _ __ ___   __ _ ___| |__   ___ _ __ 
| '_ \| | | |/ _` | / __| '_ ` _ \ / _` / __| '_ \ / _ \ '__|
| |_) | |_| | (_| | \__ \ | | | | | (_| \__ \ | | |  __/ |   
|_.__/ \__,_|\__, | |___/_| |_| |_|\__,_|___/_| |_|\___|_|   
             |___/                                           ]],
      },
    },
  },
  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)
    _G.Snacks = snacks
    vim.ui.select = snacks.picker.select
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        vim.ui.select = snacks.picker.select
      end,
    })
  end,
}
