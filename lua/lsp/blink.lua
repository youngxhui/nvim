local blink = require("blink.cmp")

blink.setup({
	completion = {
		keyword = { range = "full" },
		list = { selection = "auto_insert" },
		menu = {
			auto_show = true,
			draw = {
				components = {
					kind_icon = {
						ellipsis = false,
						text = function(ctx)
							local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
							return kind_icon
						end,
						-- Optionally, you may also use the highlights from mini.icons
						highlight = function(ctx)
							local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
							return hl
						end,
					},
				},
			},
		},
		-- Show documentation when selecting a completion item
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		-- Display a preview of the selected item on the current line
		ghost_text = { enabled = true },
	},
	keymap = require("keybindings").blink(blink),
})
