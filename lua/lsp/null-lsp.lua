local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting ---------------------
		--  brew install shfmt
		formatting.shfmt,
		-- StyLua
		formatting.stylua,
		-- rustfmt
		formatting.rustfmt,
		-- go fmt
		formatting.goimports,
		-- frontend
		-- formatting.fixjson,
		-- formatting.black.with({ extra_args = { "--fast" } }),
	},
	-- 保存自动格式化
	on_attach = function(client)
		-- if client.server_capabilities.documentFormattingProvider then
		--	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format{ async = true}")
		-- end
	end,
})
