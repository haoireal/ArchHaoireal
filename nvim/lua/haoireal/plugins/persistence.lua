-- Return the session workspace fast
return {
	"folke/persistence.nvim", -- Tải plugin persistence.nvim
	event = "BufReadPre", -- Chạy plugin khi mở file (trước khi đọc file)
	opts = {}, -- Các tùy chọn cấu hình (hiện tại chưa có thêm gì)

	-- stylua: ignore (lệnh để bỏ qua việc tự động format của stylua)

	keys = {
		-- Khôi phục session hiện tại
		{
			"<leader>ss",
			function()
				require("persistence").load()
			end,
			desc = "Khôi phục Session",
		},

		-- Chọn session cần khôi phục
		{
			"<leader>sr",
			function()
				require("persistence").select()
			end,
			desc = "Chọn Session",
		},

		-- Khôi phục session cuối cùng
		{
			"<leader>sl",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Khôi phục Session Cuối Cùng",
		},

		-- Ngừng lưu session hiện tại
		{
			"<leader>sd",
			function()
				require("persistence").stop()
			end,
			desc = "Không Lưu Session Hiện Tại",
		},
	},
}
