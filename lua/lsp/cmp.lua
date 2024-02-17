local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	-- 指定 snippet 引擎
	snippet = {
		expand = function(args)
			-- For `vsnip` users.
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	-- 补全源
	sources = cmp.config.sources({
		{ name = "codeium" },
		{ name = "nvim_lsp" },
		-- For vsnip users.
		{ name = "vsnip" },
	}, { { name = "buffer" }, { name = "path" } }),

	-- 快捷键设置
	mapping = require("keybindings").cmp(cmp),
	-- lspkind-nvim icon
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			before = function(_, vim_item)
				return vim_item
			end,
		}),
	},
})
-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
