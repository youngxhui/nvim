-- 对错误警告的图标
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	-- 在输入模式下也更新提示，设置为 true 也许会影响性能
	update_in_insert = true,
})

local signs = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

