local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	vim.notify("没有安装 Comment")
	return
end

comment.setup()
