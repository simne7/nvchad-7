require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del
local wkadd = require("which-key").add

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

del("n", "<leader>/") -- toggle comment
del("n", "<leader>rn") -- relative line number
map("n", "<leader>N", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line number" })

--
-- file
--
wkadd { { "<leader>f", group = "Files", icon = "" } }
map("n", "<leader>fs", ":w<cr>", { desc = "Save file" })
map("n", "<leader>fS", ":wa<cr>", { desc = "Save all changed files" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
map("n", "<leader>fF", "<cmd>Telescope find_files cwd=~ search_dirs=.,.local,.config<cr>", { desc = "Find files home" })
wkadd { { "<leader>fy", group = "Yank/Copy", icon = "󰙅" } }
map("n", "<leader>fyr", "<cmd>YankRelativeFilePath<cr>", { desc = "Yank relative file path" })
map("n", "<leader>fya", "<cmd>YankAbsoluteFilePath<cr>", { desc = "Yank absolute file path" })
map("n", "<leader>fyf", "<cmd>YankFileName<cr>", { desc = "Yank filename only" })
map("n", "<leader>fyh", "<cmd>YankRelativeFilePathFromHome<cr>", { desc = "Yank home-relative path" })
map("n", "<leader>fyo", "<cmd>YankRootRelativeFilePath<cr>", { desc = "Yank root-relative path" })
map("n", "<leader>fynr", "<cmd>YankRelativeFilePathWithLine<cr>", { desc = "Yank relative path with line" })
map("n", "<leader>fyna", "<cmd>YankAbsoluteFilePathWithLine<cr>", { desc = "Yank absolute path with line" })
map("n", "<leader>fynf", "<cmd>YankFileNameWithLine<cr>", { desc = "Yank filename with line" })

--
-- Marks
--
del("n", "<leader>ma")
wkadd {
  { "<leader>m", group = "Marks", icon = "" },
  { "<leader>mm", "<cmd>Telescope marks<cr>", desc = "List marks ()" },
  {
    { "gM", group = "Marks (line)", icon = "" },
    { "gm", group = "Marks (exact)", icon = "" },
  },
}
-- buffer-local marks (a–z)
for c = string.byte "a", string.byte "z" do
  local m = string.char(c)
  map({ "n", "x", "o" }, "gm" .. m, "`" .. m, {
    noremap = true,
    desc = "Jump to mark " .. m,
  })
  map({ "n", "x", "o" }, "gm" .. m, "'" .. m, {
    noremap = true,
    desc = "Line jump to mark " .. m,
  })
end

-- global / cross-buffer marks (A–Z)
for c = string.byte "A", string.byte "Z" do
  local m = string.char(c)
  map({ "n", "x", "o" }, "gm" .. m, "`" .. m, {
    noremap = true,
    desc = "Jump to global mark " .. m,
  })
  map({ "n", "x", "o" }, "gM" .. m, "'" .. m, {
    noremap = true,
    desc = "Line jump to global mark " .. m,
  })
end

--
-- search
--
wkadd { { "<leader>s", group = "Search", icon = "" } }
del("n", "<leader>fw")
map("n", "<leader>sp", "<cmd>Telescope live_grep<cr>", { desc = "Search project (grep)" })
del("n", "<leader>fz")
map("n", "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search buffer (fuzzy)" })

--
-- buffer
--
wkadd { { "<leader>b", group = "Buffers", icon = "" } }
del("n", "<leader>b")
del("n", "<leader>x")
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
map("n", "<leader>bd", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })
map("n", "<leader>bs", "<cmd>enew<cr><cmd>Telescope filetypes<cr>", { desc = "Open scratch buffer" })
map("n", "<leader>bY", "ggVGy", { desc = "Yank buffer" })
map("n", "<leader>bP", "ggVGp", { desc = "Paste and replace buffer" })
map("n", "<leader><tab>", "<cmd>b#<cr>", { desc = "Switch to previously edited buffer" })

--
-- projects
--
wkadd {
  { "<leader>p", group = "Projects", icon = "" },
  {
    "<leader>pp",
    "<cmd>Telescope projects<cr>",
    desc = "List projects ()",
    mode = "n",
  },
}

-- tabs
-- TODO something like <gt> (:tabnext) or <gT> (:tabprevious), but with :tabn X (go to tab with number X)

--
-- window
--
wkadd { { "<leader>w", group = "Windows", icon = "" } }
map("n", "<leader>ww", function()
  local winId = require("window-picker").pick_window()
  vim.api.nvim_set_current_win(winId)
end, {
  desc = "Jump to window",
})
map("n", "<leader>wJ", "<C-w>J", { desc = "Move window to far bottom" })
map("n", "<leader>wK", "<C-w>K", { desc = "Move window to far top" })
map("n", "<leader>wL", "<C-w>L", { desc = "Move window to far right" })
map("n", "<leader>wH", "<C-w>H", { desc = "Move window to far left" })
map("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>wT", "<C-w>T", { desc = "Break out into new tab" })
map("n", "<leader>wx", "<C-w>x", { desc = "Swap current with next" })
map("n", "<leader>wd", "<C-w>q", { desc = "Close window" })
map("n", "<leader>wj", "<C-w>-", { desc = "Decrease height" })
map("n", "<leader>wk", "<C-w>+", { desc = "Increase height" })
map("n", "<leader>wh", "<C-w><", { desc = "Decrease width" })
map("n", "<leader>wl", "<C-w>>", { desc = "Increase width" })
map("n", "<leader>w_", "<C-w>_", { desc = "Max out the height" })
map("n", "<leader>w.", "<C-w>|", { desc = "Max out the width" })
map("n", "<leader>w-", "<C-w>=", { desc = "Equal height and width" })

--
-- whichkey
--
wkadd {
  { "<leader>W", group = "WhichKey", icon = "" },
  {
    mode = { "n", "v" },
    { "<leader>WK", "<cmd>WhichKey <CR>", desc = "whichkey all keymaps" },
    {
      "<leader>Wk",
      function()
        vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
      end,
      desc = "whichkey query lookup",
    },
  },
}

--
-- LSP
--
del("n", "<leader>ds") -- LSP diagnostics loclist
wkadd { { "<leader>l", group = "LSP", icon = "" } }
wkadd { { "<leader>lw", group = "Workspace", icon = "" } }
map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
map("n", "<leader>lwl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<leader>lr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP references ()" })
map("n", "<leader>li", "<cmd>Telescope lsp_implementations<cr>", { desc = "LSP implementations()" })

wkadd { { "<leader>r", group = "Refactor", icon = "" } }
map("n", "<leader>rr", function()
  require "nvchad.lsp.renamer"
end, { desc = "Rename" })

--
-- Git
--
del("n", "<leader>cm")
del("n", "<leader>gt")
wkadd { { "<leader>g", group = "Git", icon = "" } }
map("n", "<leader>gS", "<cmd>Telescope git_status<cr>", { desc = "Git status ()" })
map("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits ()" })
map("n", "<leader>gZ", "<cmd>Telescope git_stash<cr>", { desc = "Git stash ()" })

--
-- Text
--
wkadd {
  { "<leader>x", group = "Text", icon = "" },
  {
    mode = { "n", "v" },
    { "<leader>xu", "bvegue", desc = "Lowercase word unter cursor", icon = "󰬶" },
    { "<leader>xU", "bvegUe", desc = "Uppercase word unter cursor", icon = "󰬵" },
  },
  { "<leader>xl", group = "Lines", icon = "" },
  { "<leader>xls", "<cmd>Sort<cr>", desc = "Sort lines" },
}

-- Trouble
wkadd {
  "<leader>t",
  group = "Trouble",
  icon = "",
}

--
-- Misc
--
wkadd {
  { "<leader>q", group = "Quit", icon = "󰩈" },
  { "<leader>qq", ":qa<cr>", desc = "Quit nvim", mode = "n" },
  { "<leader>qQ", ":qa!<cr>", desc = "Kill nvim", mode = "n" },
}
