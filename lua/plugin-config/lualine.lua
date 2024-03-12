-- 如果找不到lualine 组件，就不继续执行
local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end
local mode_groups = {
	["n"] = { "NORMAL", "Feline_NormalMode" },
	["no"] = { "N-PENDING", "Feline_NormalMode" },
	["i"] = { "INSERT", "Feline_InsertMode" },
	["ic"] = { "INSERT", "Feline_InsertMode" },
	["t"] = { "TERMINAL", "Feline_TerminalMode" },
	["v"] = { "VISUAL", "Feline_VisualMode" },
	["V"] = { "V-LINE", "Feline_VisualMode" },
	[""] = { "V-BLOCK", "Feline_VisualMode" },
	["R"] = { "REPLACE", "Feline_ReplaceMode" },
	["Rv"] = { "V-REPLACE", "Feline_ReplaceMode" },
	["s"] = { "SELECT", "Feline_SelectMode" },
	["S"] = { "S-LINE", "Feline_SelectMode" },
	[""] = { "S-BLOCK", "Feline_SelectMode" },
	["c"] = { "COMMAND", "Feline_CommandMode" },
	["cv"] = { "COMMAND", "Feline_CommandMode" },
	["ce"] = { "COMMAND", "Feline_CommandMode" },
	["r"] = { "PROMPT", "Feline_ConfirmMode" },
	["rm"] = { "MORE", "Feline_ConfirmMode" },
	["r?"] = { "CONFIRM", "Feline_ConfirmMode" },
	["!"] = { "SHELL", "Feline_TerminalMode" },
}
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
				function()
					return " " .. mode_groups[vim.fn.mode()][1]
				end,
				-- "mode",
				-- icons_enabled = true,
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
			{
				"branch",
				icon = "",
				colored = true,
			},
			{
				"diff",
				symbols = { added = " ", modified = "󰝤 ", removed = " " },
			},
		},
		lualine_x = {
			"filesize",
			{
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return "LSP"
						end
					end
					return msg
				end,

				icon = " ",
			},
		},

		lualine_z = {
			"progress",
		},
	},
})
