local status_ok, codeium = pcall(require, "codeium")
if not status_ok then
	vim.notify("没有安装 codeium")
	return
end

codeium.setup({
	vim.keymap.set("i", "<C-g>", function()
		return vim.fn["codeium#Accept"]()
	end, { expr = true }),
	vim.keymap.set("i", "<c-;>", function()
		return vim.fn["codeium#CycleCompletions"](1)
	end, { expr = true }),
	vim.keymap.set("i", "<c-,>", function()
		return vim.fn["codeium#CycleCompletions"](-1)
	end, { expr = true }),
	vim.keymap.set("i", "<c-x>", function()
		return vim.fn["codeium#Clear"]()
	end, { expr = true }),
})
