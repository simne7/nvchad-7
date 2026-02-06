return {
  -- Flash cursor whenever it jumps some distance or moves between windows
  -- https://github.com/DanilaMihailov/beacon.nvim
  { "danilamihailov/beacon.nvim", event = "CursorMoved" },

  -- Highlight other uses of the word under the cursor
  -- https://github.com/RRethy/vim-illuminate
  { "RRethy/vim-illuminate", lazy = false },

  -- A collection of QoL plugins for Neovim
  -- https://github.com/folke/snacks.nvim
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },

  -- Sorting plugin for Neovim that supports line-wise and delimiter sorting.
  -- https://github.com/sQVe/sort.nvim
  { "sQVe/sort.nvim", cmd = { "Sort" } },

  -- plugin that provides convenient commands to copy (yank) file paths
  -- https://github.com/neumachen/yank-file-path.nvim
  {
    "neumachen/yank-file-path.nvim",
    -- cmd = { "YankFilePath" },
    keys = "<leader>fy",
    opts = {
      setup_mappings = false,
      enable_default_mappings = false,
    },
    -- config = function()
    --   require("yank-file-path").setup {
    --     -- Optional: customize root markers for root-relative paths
    --     root_markers = { ".git", "package.json", "Cargo.toml", "pyproject.toml" },
    --     -- Optional: disable default key mappings
    --     enable_default_mappings = false,
    --   }
    -- end,
  },
}
