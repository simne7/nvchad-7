local map = vim.keymap.set
local del = vim.keymap.del

-- load nvchad config and override/extend on_attach listener
local nvlsp = require "nvchad.configs.lspconfig"
local original_on_attach = nvlsp.on_attach
nvlsp.on_attach = function(_, bufnr)
  original_on_attach(_, bufnr)

  map("n", "<leader>lh", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, { desc = "Toggle inlay hints", buffer = bufnr })

  del("n", "<leader>wa", { buffer = bufnr }) -- add folder to workspace -> <leader>lwa
  del("n", "<leader>wr", { buffer = bufnr }) -- remove folder from workspace -> <leader>lwr
  del("n", "<leader>wl", { buffer = bufnr }) -- list workspace folders -> <leader>lwl
  del("n", "<leader>ra", { buffer = bufnr }) -- NvRenamer -> <leader>rr
end

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

local M = {}

M.defaults = function()
  nvlsp.defaults()
end

return M
