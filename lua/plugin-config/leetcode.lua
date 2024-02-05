local status, lc = pcall(require, "leetcode")
if not status then
	vim.notify("leetcode not install")
end

lc.setup({
	lang = "golang",
	image_supprot = true,
	injector = {
		["golang"] = {
			before = { "package leetcode" },
		},
	},
})
