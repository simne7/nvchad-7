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

  -- Neovim 0.12 crashes with "attempt to call method 'range' (a nil value)"
  -- inside get_range() when an injection match holds a nil content node.
  -- This happens with streamed buffers (e.g. CodeCompanion) where the tree
  -- changes between query execution and range extraction.
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      local _orig_get_parser = vim.treesitter.get_parser
      vim.treesitter.get_parser = function(bufnr, lang, opts_p)
        local parser = _orig_get_parser(bufnr, lang, opts_p)
        if not parser or parser._nil_range_guard then
          return parser
        end
        local _orig_parse = parser.parse
        parser.parse = function(self, range)
          local ok, a, b = pcall(_orig_parse, self, range)
          if not ok then
            if type(a) == "string" and a:find "attempt to call method 'range'" then
              return self._trees or {}, false
            end
            error(a, 2)
          end
          return a, b
        end
        parser._nil_range_guard = true
        return parser
      end

      require("nvim-treesitter.configs").setup(opts)
    end,
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
