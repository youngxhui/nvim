local status, flash = pcall(require, "flash")
if not status then
	vim.notify("flash")
	return
end

flash.setup({})
