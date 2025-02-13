-- Hight Light the same word or syntax at the file code
return {
	"RRethy/vim-illuminate",
	config = function()
		-- cấu hình mặc định
		require("illuminate").configure({
			-- providers: nhà cung cấp được sử dụng để lấy tham chiếu trong buffer, sắp xếp theo thứ tự ưu tiên
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			-- delay: độ trễ tính bằng mili giây
			delay = 100,
			-- filetype_overrides: ghi đè cụ thể cho từng loại tệp.
			-- Các khóa là chuỗi đại diện cho loại tệp, giá trị là bảng hỗ trợ các khóa giống như truyền vào .configure, ngoại trừ filetypes_denylist và filetypes_allowlist
			filetype_overrides = {},
			-- filetypes_denylist: loại tệp không được highlight, ghi đè filetypes_allowlist
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"fugitive",
			},
			-- filetypes_allowlist: loại tệp được highlight, bị ghi đè bởi filetypes_denylist
			-- Cần đặt filetypes_denylist = {} để ghi đè giá trị mặc định và filetypes_allowlist mới có tác dụng
			filetypes_allowlist = {},
			-- modes_denylist: các chế độ không được highlight, ghi đè modes_allowlist
			-- Xem `:help mode()` để biết các giá trị có thể
			modes_denylist = {},
			-- modes_allowlist: các chế độ được highlight, bị ghi đè bởi modes_denylist
			-- Xem `:help mode()` để biết các giá trị có thể
			modes_allowlist = {},
			-- providers_regex_syntax_denylist: cú pháp không được highlight, ghi đè providers_regex_syntax_allowlist
			-- Chỉ áp dụng cho nhà cung cấp 'regex'
			-- Sử dụng :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
			providers_regex_syntax_denylist = {},
			-- providers_regex_syntax_allowlist: cú pháp được highlight, bị ghi đè bởi providers_regex_syntax_denylist
			-- Chỉ áp dụng cho nhà cung cấp 'regex'
			-- Sử dụng :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
			providers_regex_syntax_allowlist = {},
			-- under_cursor: có highlight tại vị trí con trỏ hay không
			under_cursor = true,
			-- large_file_cutoff: số dòng tối đa để sử dụng cấu hình cho tệp lớn
			-- Tùy chọn `under_cursor` sẽ bị vô hiệu hóa nếu đạt đến giới hạn này
			large_file_cutoff = nil,
			-- large_file_config: cấu hình sử dụng cho tệp lớn (dựa trên large_file_cutoff).
			-- Hỗ trợ các khóa giống như truyền vào .configure
			-- Nếu đặt là nil, vim-illuminate sẽ bị tắt cho các tệp lớn.
			large_file_overrides = nil,
			-- min_count_to_highlight: số lượng khớp tối thiểu cần thiết để thực hiện highlight
			min_count_to_highlight = 1,
			-- should_enable: một callback ghi đè tất cả cài đặt khác để
			-- bật/tắt highlight. Hàm này sẽ được gọi nhiều lần nên tránh các thao tác nặng.
			should_enable = function(bufnr)
				return true
			end,
			-- case_insensitive_regex: đặt độ nhạy chữ hoa/thường cho regex
			case_insensitive_regex = false,
		})
	end,
}
