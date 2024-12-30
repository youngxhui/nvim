local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

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
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"rcarriga/nvim-notify",
	"nvim-lua/lsp-status.nvim",
	"petertriho/nvim-scrollbar",
	--icon
	"echasnovski/mini.icons",
	-- file tree
	{ "nvim-tree/nvim-web-devicons" },
	{ "kyazdani42/nvim-tree.lua", event = "VimEnter" },
	{ "akinsho/bufferline.nvim", dependencies = { "moll/vim-bbye" } },
	{ "nvim-lualine/lualine.nvim" },
	{ "arkav/lualine-lsp-progress" },
	-- flash
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},
	-- telescope
	{ "nvim-telescope/telescope.nvim" },
	"LinArcX/telescope-env.nvim",

	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	-- dashboard
	{ "nvimdev/dashboard-nvim", event = "VimEnter", dependencies = { { "nvim-tree/nvim-web-devicons" } } },
	"ahmedkhalf/project.nvim",

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "neovim/nvim-lspconfig", dependencies = { "saghen/blink.cmp" } },
	{ "nvimdev/lspsaga.nvim", event = "BufEnter" },
	-- terminal
	"voldikss/vim-floaterm",
	-- format
	{ "nvimtools/none-ls.nvim", dependencies = "nvim-lua/plenary.nvim" },
	-- 补全
	{
		"saghen/blink.cmp",
		dependencies = { "saghen/blink.compat", "exafunction/codeium.nvim" },
		version = "*",
	},

	"windwp/nvim-autopairs",
	"HiPhish/rainbow-delimiters.nvim",
	-- git
	"lewis6991/gitsigns.nvim",
	-- dap
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
	"theHamsta/nvim-dap-virtual-text",
	-- go dap
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
		},
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
	},
	-- auto save
	"Pocco81/auto-save.nvim",
	-- markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})
