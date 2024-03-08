local status, devicons = pcall(require, "nvim-web-devicons")
if not status then
	vim.notify("没有找到 nvim-web-devicons")
	return
end

devicons.setup({
	override_by_filename = {
		["go.sum"] = {
			icon = "",
			color = "#8e3e58",
			name = "GoModSum",
		},
		["go.mod"] = {
			icon = "",
			color = "#da4f7a",
			name = "GoMod",
		},
	},
	override_by_extension = {
		["tsx"] = {
			icon = "",
			color = "#499cc6",
			cterm_color = "26",
			name = "Tsx",
		},
		["go"] = {
			icon = "",
			color = "#4ba4cc",
			cterm_color = "24",
			name = "Go",
		},
		["astro"] = {
			icon = "",
			color = "#f1502f",
			name = "Astro",
		},
	},
	default = true,
})
