return {
	"tadaa/vimade", -- Plugin vimade tạo hiệu ứng mờ cho cửa sổ không được focus
	opts = {
		-- Chế độ hiệu ứng, có thể là 'default', 'minimalist', 'duo', 'ripple'.
		-- Cài đặt animate = false để vô hiệu hóa hiệu ứng hoạt hình.
		recipe = { "default", { animate = true } },

		-- Chế độ sử dụng: 'buffers' để làm mờ các cửa sổ không phải là cửa sổ hiện tại
		ncmode = "buffers",

		-- Độ mờ của cửa sổ không được focus, giá trị từ 0 đến 1
		-- 0 là hoàn toàn ẩn, 1 là không mờ
		fadelevel = 0.4,

		-- Tạo hiệu ứng màu sắc cho cửa sổ (màu nền, màu chữ, v.v.)
		-- Tùy chọn này có thể thay đổi màu nền hoặc màu chữ của cửa sổ không có focus.
		tint = {
			-- Có thể tùy chỉnh thêm màu sắc cho các thành phần của cửa sổ
		},

		-- Chế độ nền, có thể sử dụng màu sắc cho nền trong terminal (chế độ trong suốt).
		basebg = "",

		-- Blocklist giúp tránh việc áp dụng hiệu ứng cho một số cửa sổ hoặc buffer nhất định.
		-- Ví dụ như các cửa sổ terminal hoặc các cửa sổ liên quan đến prompt.
		blocklist = {
			default = {
				buf_opts = { buftype = { "prompt", "terminal" } }, -- Bỏ qua cửa sổ loại 'prompt' và 'terminal'
				win_config = { relative = true },
			},
		},

		-- Link các cửa sổ lại với nhau để chúng có thể thay đổi cùng lúc, tạo hiệu ứng đồng nhất.
		link = {},

		-- Liên kết các thay đổi trong diff để các thay đổi cùng được áp dụng
		groupdiff = true,

		-- Không liên kết scrollbinding của các cửa sổ
		groupscrollbind = false,

		-- Bật tắt hiệu ứng mờ khi focus chuyển sang một cửa sổ khác
		enablefocusfading = true,

		-- Nếu nohlcheck là false, hệ thống highlight sẽ được tính lại khi có thay đổi.
		nohlcheck = true,
	},
}
