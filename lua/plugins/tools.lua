return {
  -- A pretty list for showing diagnostics, references, telescope results,
  -- quickfix and location lists to help you solve all the trouble your code is causing.
  -- https://github.com/folke/trouble.nvim
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options
    cmd = "Trouble",
    keys = {
      {
        "<leader>tx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics",
      },
      {
        "<leader>tX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer diagnostics",
      },
      {
        "<leader>ts",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols",
      },
      {
        "<leader>tl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ...",
      },
      {
        "<leader>tL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List",
      },
      {
        "<leader>tQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List",
      },
    },
  },

  -- Highlight, list and search todo comments in your projects
  -- https://github.com/folke/todo-comments.nvim?tab=readme-ov-file
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Trouble todo",
    keys = {
      { "<leader>tt", "<cmd>Trouble todo<cr>", desc = "TODO list" },
    },
    opts = {}, -- for default options
    -- lazy = false,
  },

  -- A git interface inspired by Magit
  -- https://github.com/NeogitOrg/neogit
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Git status" },
    },
    opts = {
      status = {
        mode_text = {
          M = "modified 󰙏",
          A = "added 󰓎",
          N = "new file 󰓎",
          D = "deleted 󰩹",
        },
      },
      highlight = { -- doomchad colors
        bg0 = "#282c34",
        bg1 = "#32363e",
        bg2 = "#3c4048",
        bg3 = "#4e525a",
        grey = "#a7aebb",
        white = "#bbc2cf",
        red = "#ff6b5a",
        orange = "#ea9558",
        yellow = "#ECBE7B",
        green = "#98be65",
        cyan = "#46D9FF",
        blue = "#51afef",
        purple = "#dc8ef3",
        md_purple = "#c678dd",
      },
      console_timeout = 0,
      auto_close_console = false,
    },
  },

  -- A better user experience for viewing and interacting with Vim marks.
  -- https://github.com/chentoast/marks.nvim
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
