local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

-- 列表操作快捷键
local list_keys = require("keybindings").nvimTreeList
nvim_tree.setup({
	sort_by = "case_sensitive",
	-- 不显示 git 状态图标
	git = {
		enable = true,
	},
	-- project plugin 需要这样设置
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	-- 隐藏 .文件 和 node_modules 文件夹
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
	},
	view = {
		-- 宽度
		width = 30,
		-- 也可以 'right'
		side = "left",
		-- 隐藏根目录
		hide_root_folder = true,
		-- 自定义列表中快捷键
		mappings = {
			custom_only = false,
			list = list_keys,
		},
		-- 不显示行数
		number = false,
		relativenumber = false,
		-- 显示图标
		signcolumn = "yes",
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				git = true,
				file = true,
				folder = true,
				folder_arrow = true,
			},
			glyphs = {
				bookmark = " ",
				folder = {
					arrow_closed = "⏵",
					arrow_open = "⏷",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "⌥",
					renamed = "➜",
					untracked = "★",
					deleted = "⊖",
					ignored = "◌",
				},
			},
		},
	},
	actions = {
		open_file = {
			-- 首次打开大小适配
			resize_window = true,
			-- 打开文件时关闭
			quit_on_open = true,
		},
	},
	-- wsl install -g wsl-open
	-- https://github.com/4U6U57/wsl-open/
	system_open = {
		cmd = "open", -- mac 直接设置为 open
	},
})
