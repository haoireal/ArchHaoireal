return {
	"sphamba/smear-cursor.nvim",
	event = "VeryLazy",
	cond = vim.g.neovide == nil,
	opts = {
		hide_target_hack = true,
		cursor_color = "none",
		smear_speed = 0, -- Giảm giá trị này để tăng tốc độ hiệu ứng (mặc định 2)
		smear_alpha = 0.88888888, -- Điều chỉnh mức độ mờ (0 đến 1). Đặt thấp hơn để giảm độ mờ, làm cho hiệu ứng nhanh hơn
		smear_length = 20, -- Chiều dài vệt con trỏ. Giảm giá trị này để hiệu ứng nhanh hơn
	},
	specs = {
		-- disable mini.animate cursor

		"echasnovski/mini.animate",
		optional = true,
		opts = {
			cursor = { enable = false },
		},
	},
}
