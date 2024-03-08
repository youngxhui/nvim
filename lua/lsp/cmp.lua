local cmp = require("cmp")
local lspkind = require("lspkind")
local types = require("cmp.types")
local str = require("cmp.utils.str")

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
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),

	-- 快捷键设置
	mapping = require("keybindings").cmp(cmp),
	-- lspkind-nvim icon
	formatting = {
		completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			scrollbar = "║",
		},
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 20,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				-- Get the full snippet (and only keep first line)
				local word = entry:get_insert_text()
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
					word = vim.lsp.util.parse_snippet(word)
				end
				word = str.oneline(word)
				if
					entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
					and string.sub(vim_item.abbr, -1, -1) == "~"
				then
					word = word .. "~"
				end
				vim_item.abbr = word
				return vim_item
			end,
		}),
	},
	experimental = {
		ghost_text = true,
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
