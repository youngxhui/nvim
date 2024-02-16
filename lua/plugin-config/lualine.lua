-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

lualine.setup({
	options = {
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_a = {
			{
				"mode",
				icons_enabled = true,
			},
		},
		lualine_b = {
			{
				"filetype",
				colored = true,
				icon_only = true,
			},
			"filename",
		},
		lualine_c = {
			"branch",
			{
				"lsp_status",
				spinner_symbols = { " ", " ", " ", " ", " ", " " },
			},
			"diff",
		},
		lualine_x = {},

		lualine_y = {},
		lualine_z = {
			"progress",
		},
	},
})
