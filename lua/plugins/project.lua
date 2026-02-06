return {
  -- File explorer tree for neovim written in lua
  -- https://github.com/nvim-tree/nvim-tree.lua/tree/master
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
            picker = function()
              return require("window-picker").pick_window()
            end,
          },
        },
      },
    },
    dependencies = {
      "s1n7ax/nvim-window-picker",
    },
  },

  -- Prompts the user to pick a window and returns the window id of the picked window
  -- https://github.com/s1n7ax/nvim-window-picker
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup {
        hint = "floating-big-letter",
        show_prompt = false,
      }
    end,
  },

  -- The superior project management solution for neovim.
  -- https://github.com/ahmedkhalf/project.nvim
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end,
  },

  -- Small automated session manager for Neovim
  -- https://github.com/rmagatti/auto-session
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      auto_restore = false,
      suppressed_dirs = { "~/", "~/Workspace" },
    },
  },
}
