local set = vim.opt
local cmd = vim.cmd
local o = vim.o
local g = vim.g
local map = vim.api.nvim_set_keymap

-- global configs
set.encoding = "utf-8"
set.wrap = true
set.expandtab = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 4

set.showcmd = true
set.laststatus = 2
set.autowrite = true
set.cursorline = true
set.autoread = true

set.number = true

set.clipboard = "unnamedplus"
o.termguicolors = true

cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- search case sensitive
o.ignorecase = true
o.smartcase = true
o.incsearch = true

-- mappings
local opts = { noremap = true }

map("n", "<Esc>", ":noh<CR>", opts)

map("n", "<Space>", "", {})
g.mapleader = " "
map("n", ";", ":", {})
map("n", "<C-s>", ":w<CR>", {})
map("i", "<C-s>", "<Esc>:w<CR>a", {})

-- delete
map("n", "<leader>", "di'", opts)
map("n", "<leader>''", 'di"', opts)
map("n", "<leader>s", "ci'", opts)
map("n", "<leader>s''", 'ci"', opts)
map("n", "<leader>[", "va{", opts)

-- copy to clipboard
map("v", "<C-y>", '"*y', opts)
map("n", "<C-p>", '"*p', opts)

-- screens
map("n", "<leader>b", "<C-w>v", opts)
map("n", "<leader>bd", "<C-w>s", opts)
map("n", "<leader>x", "<ESc>:q<CR>", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)

-- tabs
map("n", "<leader>t", "<ESc>:tabnew<CR>", opts)
map("n", "<tab>", "gt", opts)

-- colors
-- cmd [[colorscheme monokai]]

function Light()
	set.background = "light"
	cmd([[colorscheme everforest]])
end

function Dark()
	set.background = "dark"
	cmd([[colorscheme monokai]])
end

map("n", "<leader>bl", ":lua Light()<CR>", opts)
map("n", "<leader>bd", ":lua Dark()<CR>", opts)

-- prettier
g["prettier#quickfix_enabled"] = "1"
g["prettier#config#single_quote"] = "true"
g["prettier#config#trailing_comma"] = "es5"
g["prettier#config#semi"] = "true"
