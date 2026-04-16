return {
  -- AI Coding, Vim Style
  -- https://github.com/olimorris/codecompanion.nvim
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },

    keys = {
      {
        "<leader>cc",
        "<cmd>CodeCompanionChat<cr>",
        desc = "CodeCompanion Chat",
      },
    },
    opts = {
      interactions = {
        chat = {
          adapter = "claude_code",
          model = "claude-sonnet-4-20250514"
        },
      },
      adapters = {
        acp = {
          claude_code = function()
            return require("codecompanion.adapters").extend("claude_code", {
              env = {
                CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
              },
            })
          end,
        },
      },
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = "DEBUG",
      },
    },
  },
}
