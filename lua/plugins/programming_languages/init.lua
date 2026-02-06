-- TODO: neovim/nvchad
--  - debugger
return {
  -- Code format (on save)
  -- https://github.com/stevearc/conform.nvim/tree/master
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = require "configs.conform",
    keys = {
      {
        "<leader>bf",
        function()
          require("conform").format { async = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
  },

  -- LSP quick start config
  -- https://github.com/neovim/nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
      -- require("configs.lspconfig").defaults()
    end,
  },

  -- Treesitter configurations and abstraction layer
  -- github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "html",
        "css",
        "rust",
      },
      indent = {
        enable = true,
      },
    },
  },

  { import = "plugins.programming_languages" },
}
