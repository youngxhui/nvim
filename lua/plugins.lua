-- local packer = require("packer")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.notify("lazy path")
vim.notify(lazypath)

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- UI --
	-- - theme
	"navarasu/onedark.nvim",
	"folke/tokyonight.nvim",
	"rcarriga/nvim-notify",
	-- file tree
	{ "kyazdani42/nvim-tree.lua", event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" } },
	{ "nvim-lualine/lualine.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "arkav/lualine-lsp-progress" },
	-- telescope
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1" },
	"LinArcX/telescope-env.nvim",
	-- 自动补全
	{ "windwp/nvim-autopairs" },

	{ "lukas-reineke/indent-blankline.nvim" },
	-- dashboard
	{ "glepnir/dashboard-nvim", event = "VimEnter", dependencies = { { "nvim-tree/nvim-web-devicons" } } },
	"ahmedkhalf/project.nvim",

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	{ "glepnir/lspsaga.nvim", event = "BufRead" },
	-- terminal
	"voldikss/vim-floaterm",
	-- format
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = "nvim-lua/plenary.nvim" },
	-- 补全
	"hrsh7th/nvim-cmp",
	"hrsh7th/vim-vsnip",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"mortepau/codicons.nvim",

	-- 常见片段
	"rafamadriz/friendly-snippets",
	"onsails/lspkind-nvim",
	-- git
	"lewis6991/gitsigns.nvim",
	-- dap
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	-- go dap
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
		},
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	-- auto save
	"Pocco81/auto-save.nvim",
})
