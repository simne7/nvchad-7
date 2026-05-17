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
  map("n", "<leader>rr", require "nvchad.lsp.renamer", { buffer = bufnr, desc = "Rename" })
end

---Specialized root pattern that allows for an exclusion
---@param opt { root: string[], exclude: string[] }
---@return fun(bufnr: integer, on_dir: fun(dir: string|nil))
---@see https://www.npbee.me/posts/deno-and-typescript-in-a-monorepo-neovim-lsp
local function root_pattern_exclude(opt)
  local lsputil = require('lspconfig.util')

  return function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local excluded_root = lsputil.root_pattern(opt.exclude)(fname)
    if not excluded_root then
      on_dir(lsputil.root_pattern(opt.root)(fname))
    end
  end
end

-- see https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#configuration
-- customization ideas: https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
local servers = {
  docker_compose_language_service = {},
  cssls = {},
  denols = {
    root_dir = root_pattern_exclude({
      root = { "deno.json", "deno.jsonc", "deno.lock" },
      exclude = {}
    }),
    single_file_support = false,
    settings = {},
  },
  eslint = {},
  html = {},
  jsonls = {},
  pylsp = {},
  -- tailwindcss = {},
  ts_ls = {
    root_dir = root_pattern_exclude({
      root = { "package.json" },
      exclude = { "deno.json", "deno.jsonc", "deno.lock" }
    }),
    single_file_support = false,
    settings = {},
  },
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name)
  if next(opts) ~= nil then
    vim.lsp.config(name, opts)
  end
end

local M = {}

M.defaults = function()
  nvlsp.defaults()
end

return M
