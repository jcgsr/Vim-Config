-- lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"nvim-lualine/lualine.nvim",
	"lewis6991/gitsigns.nvim",
	"nvim-tree/nvim-tree.lua",
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	"tpope/vim-fugitive",
	"m4xshen/autoclose.nvim",
	"tpope/vim-commentary",
	"tanvirtin/monokai.nvim",
	"neanias/everforest-nvim",
	"nvim-tree/nvim-web-devicons",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"othree/html5.vim",
	"pangloss/vim-javascript",
	"evanleck/vim-svelte",
	-- completion
	"stevearc/conform.nvim",
	opts = {},
	"quangnguyen30192/cmp-nvim-ultisnips",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
}

local opts = {}
require("lazy").setup(plugins, opts)
