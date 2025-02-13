--Faster commnet
return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		-- Nhập plugin comment một cách an toàn
		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- Kích hoạt tính năng comment
		comment.setup({
			-- Thêm khoảng trắng giữa dấu comment và dòng code
			padding = true, -- Thêm khoảng trắng giữa dấu comment và dòng code

			-- Kiểm tra xem con trỏ có nên giữ nguyên vị trí khi xuống dòng không
			sticky = true, -- Con trỏ sẽ giữ nguyên vị trí khi comment

			-- Các dòng cần bỏ qua khi comment (tuỳ chọn)
			ignore = nil, -- Các dòng sẽ bị bỏ qua khi comment hoặc bỏ comment

			-- Cấu hình các phím tắt để bật/tắt comment trong chế độ NORMAL
			toggler = {
				-- Phím tắt để bật/tắt comment một dòng
				line = "gcc",
				-- Phím tắt để bật/tắt comment một block
				block = "gbc",
			},

			-- Cấu hình các phím tắt cho các thao tác trong chế độ NORMAL và VISUAL
			opleader = {
				-- Phím tắt để comment một dòng trong chế độ OPERATOR-PENDING
				line = "gc",
				-- Phím tắt để comment một block trong chế độ OPERATOR-PENDING
				block = "gb",
			},

			-- Cấu hình các phím tắt thêm cho các thao tác comment
			extra = {
				-- Phím tắt để thêm comment ở trên dòng hiện tại
				above = "gcO",
				-- Phím tắt để thêm comment ở dưới dòng hiện tại
				below = "gco",
				-- Phím tắt để thêm comment ở cuối dòng hiện tại
				eol = "gcA",
			},

			-- Kích hoạt các phím tắt (keybindings)
			mappings = {
				-- Kích hoạt các phím tắt cơ bản cho comment (dùng trong chế độ NORMAL và VISUAL)
				basic = true, -- Phím tắt cơ bản: `gcc`, `gbc`, `gc[count]{motion}`, `gb[count]{motion}`

				-- Kích hoạt các phím tắt bổ sung
				extra = true, -- Phím tắt bổ sung: `gco`, `gcO`, `gcA`
			},

			-- Kích hoạt pre-hook cho việc comment trong các file tsx, jsx, svelte, html
			pre_hook = ts_context_commentstring.create_pre_hook(),
			-- Hàm sẽ được gọi sau khi comment hoặc bỏ comment
			post_hook = nil, -- Hàm tùy chỉnh sau khi comment
		})
	end,
}
