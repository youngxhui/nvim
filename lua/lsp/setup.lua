require("mason").setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
	ensure_installed = { "lua_ls", "rust_analyzer" },
})

function LspKeybind(client, bufnr)
	-- 禁用格式化功能，交给专门插件插件处理
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- 绑定快捷键
	require("keybindings").mapLSP(buf_set_keymap)
end

function GoLspKeybind(client, bufnr)
	client.server_capabilities.semanticTokensProvider = {
		full = {
			delta = false,
		},
		legend = {
			-- from https://github.com/golang/tools/blob/master/gopls/internal/lsp/semantic.go#L981
			tokenTypes = {
				"namespace",
				"type",
				"class",
				"enum",
				"interface",
				"struct",
				"typeParameter",
				"parameter",
				"variable",
				"property",
				"enumMember",
				"event",
				"function",
				"method",
				"macro",
				"keyword",
				"modifier",
				"comment",
				"string",
				"number",
				"regexp",
				"operator",
			},
			tokenModifiers = {
				"declaration",
				"definition",
				"readonly",
				"static",
				"deprecated",
				"abstract",
				"async",
				"modification",
				"documentation",
				"defaultLibrary",
			},
		},
		range = true,
	}
	-- 禁用格式化功能，交给专门插件插件处理
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	-- 绑定快捷键
	require("keybindings").mapLSP(buf_set_keymap)
end
local nvim_lsp = require("lspconfig")
-- lua
-- mason.lua
nvim_lsp.lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
					hint = {
						enable = true,
					},
				},
			})
			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end,
	on_attach = LspKeybind,
})

-- rust_analyzer

nvim_lsp.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
	},
	on_attach = LspKeybind,
})

-- go
local util = require("lspconfig/util")

nvim_lsp.gopls.setup({
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
		semanticTokens = true,
	},
	on_attach = GoLspKeybind,
})

-- astro
nvim_lsp.astro.setup({
	on_attach = LspKeybind,
})

nvim_lsp.tsserver.setup({
	on_attach = LspKeybind,
	filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
})

-- tailwindcss
nvim_lsp.tailwindcss.setup({})

nvim_lsp.pyright.setup({
	on_attach = LspKeybind,
})

nvim_lsp.marksman.setup({
	on_attach = LspKeybind,
})
