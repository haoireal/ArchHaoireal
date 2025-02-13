return {
	{
		"Mofiqul/dracula.nvim",
		priority = 1000,
		config = function()
			require("dracula").setup({
				transparent_bg = true, -- Làm nền trong suốt
				italic_comment = true, -- Làm chữ nghiêng cho comment
				-- overrides = {
				-- 	-- Đồng bộ màu với các plugin khác
				-- 	CursorLine = { bg = "#44475a" }, -- Màu nền cho dòng hiện tại
				-- 	Visual = { bg = "#6272a4" }, -- Màu nền khi chọn đoạn văn bản
				-- 	Pmenu = { bg = "#282a36", fg = "#f8f8f2" }, -- Popup menu
				-- 	NotifyBackground = { bg = "none" }, -- Thông báo từ notify.nvim
				-- 	TelescopeNormal = { bg = "none" }, -- Nền chính của Telescope
				-- 	TelescopeBorder = { bg = "none", fg = "#f8f8f2" }, -- Viền Telescope
				-- },
				-- --pick theme
				vim.cmd("colorscheme dracula"),
			})
		end,
	},
	{ "ellisonleao/gruvbox.nvim" },
	{ "folke/tokyonight.nvim" },
	{ "joshdick/onedark.vim" },
	{ "arcticicestudio/nord-vim" },
}
