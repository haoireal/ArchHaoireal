return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local icons = {
			diagnostics = {
				Error = "",
				Warn = "",
				Info = "",
				Hint = "",
			},
			git = {
				added = "",
				modified = "",
				removed = "",
			},
		}
		-- Cấu hình màu sắc cho lualine
		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		-- Cấu hình cho lualine với theme và sections
		lualine.setup({
			options = {
				globalstatus = true,
				theme = "tokyonight", -- Theme mà bạn sử dụng cho thanh trạng thái
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" } },
				}, -- Hiển thị chế độ (Normal, Insert, etc.)
				lualine_b = {
					{ "branch" }, -- Hiển thị nhánh git hiện tại
					{ "diff" },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " " },
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yellow },
							info = { fg = colors.cyan },
						},
					},
				},
				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1 }, -- Showing the full path
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" }, -- Màu sắc của thông báo update
					},
					{ "fileformat" }, -- Hiển thị định dạng file
				},
				lualine_y = { "progress" }, -- Hiển thị tiến trình con trỏ
				lualine_z = {
					{ "location" },
					{
						function()
							return " " .. os.date("%R")
						end,
					}, -- Hiển thị vị trí dòng và cột
				},
				tabline = {},
				extensions = {},
			},
		})
	end,
}
