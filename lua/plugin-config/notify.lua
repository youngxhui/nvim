local notify = require("notify")
notify.setup({
	stages = "slide",
	render = "compact",
	timeout = 2000,
})
vim.notify = notify
