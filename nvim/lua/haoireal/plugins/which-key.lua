return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		spec = {
			{ "<leader>b", group = "Buffer management" },
			{ "<leader>f", group = "Find somethings you need <TeleScope>" },
			{ "<leader>t", group = "Tab management & Terminal" },
			{ "<leader>w", group = "Windows management" },
			{ "<leader>s", group = "Session management" },
			{ "<leader>x", group = "Diagnostics management" },
			{ "<leader>g", group = "Git Help Controler" },
			{ "<leader>h", group = "History of git Hunk and Diff" },
			{ "<leader>l", group = "Language Server Protocal Manager" },
			{ "<leader>e", group = "File explorer (Tree)" },
			{ "<leader>s", group = "Session management" },
		},
		win = {
			-- Cài đặt viền cho cửa sổ
			border = "rounded", -- Các lựa chọn: "none", "single", "double", "rounded", "solid"
			no_overlap = true, -- Không cho cửa sổ chồng lên con trỏ
			padding = { 1, 1 }, -- Thêm padding vào cửa sổ (trên/dưới, trái/phải)
			title = true, -- Hiển thị tiêu đề cho cửa sổ
			title_pos = "center", -- Vị trí của tiêu đề: "left", "center", "right"
			zindex = 1000, -- Z-index để điều khiển độ ưu tiên của cửa sổ
			col = math.floor(vim.o.columns * 0.5) - 20, -- Căn giữa cửa sổ (lấy 50% chiều rộng của màn hình và bớt đi 20)
		},
		layout = {
			width = { min = 20, max = 50 }, -- Độ rộng tối thiểu và tối đa của cửa sổ
			height = { min = 5, max = 5 }, -- Độ cao tối thiểu và tối đa của cửa sổ
			align = "center", -- Căn giữa mọi thứ
			spacing = 1, -- Khoảng cách giữa các cột
		},
		icons = {
			group = "▶ ", -- Biểu tượng cho các nhóm
			key = "", -- Biểu tượng cho các phím tắt
			separator = "➤", -- Biểu tượng phân tách các mục
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
