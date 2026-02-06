require("nvchad.configs.lspconfig").defaults()

-- see https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#configuration
-- customization ideas: https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
local servers = {
  jsonls = {},
  tailwindcss = {},
  ts_ls = {},
  eslint = {},
  cssls = {},
  html = {},
  pylsp = {},
}

for name, opts in pairs(servers) do
  if next(opts) ~= nil then
    vim.lsp.config(name, opts)
  end
  vim.lsp.enable(name)
end
--

local M = {}
local map = vim.keymap.set
local del = vim.keymap.del

M.on_attach = function(_, _)
  map("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = "Toggle inlay hints", nowait = true })

  del("n", "<leader>wa")
  del("n", "<leader>wr")
  del("n", "<leader>wl")
  del("n", "<leader>ra")
end

M.defaults = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      M.on_attach(_, args.buf)
    end,
  })
end

return M
