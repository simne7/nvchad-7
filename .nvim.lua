vim.diagnostic.config {
  virtual_text = true,
  -- virtual_text = {
  --   severity = { min = vim.diagnostic.severity.WARN },
  -- },
  underline = true,
  signs = true,
  severity_sort = true,
}

-- vim.lsp.config("ts_ls", {
--   settings = {
--     typescript = {
--       diagnostics = {
--         ignoredCodes = { 6133 }, -- 6133 = unused local
--       },
--     },
--     javascript = {
--       diagnostics = {
--         ignoredCodes = { 6133 },
--       },
--     },
--   },
-- })
