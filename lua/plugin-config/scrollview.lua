local status, scrollview = pcall(require, "scrollbar")
if not status then
	vim.notify("没有找到 scrollbar")
	return
end

scrollview.setup({})
