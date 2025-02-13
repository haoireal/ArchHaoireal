vim.cmd("let g:netrw_liststyle = 3") -- Đặt kiểu hiển thị của plugin netrw (kiểu danh sách)

local opt = vim.opt

opt.relativenumber = false -- Hiển thị số dòng tương đối
opt.number = true -- Hiển thị số dòng tuyệt đối

-- Cài đặt tab và thụt lề
opt.tabstop = 2 -- Sử dụng 2 khoảng trắng cho một tab (theo mặc định của Prettier)
opt.shiftwidth = 2 -- Thụt lề sử dụng 2 khoảng trắng
opt.expandtab = true -- Thay tab bằng khoảng trắng
opt.autoindent = true -- Sao chép thụt lề từ dòng hiện tại khi tạo dòng mới

opt.wrap = false -- Không tự động xuống dòng

-- Cài đặt tìm kiếm
opt.ignorecase = true -- Bỏ qua phân biệt chữ hoa/chữ thường khi tìm kiếm
opt.smartcase = true -- Nếu có ký tự hoa trong tìm kiếm, bật chế độ phân biệt chữ hoa/chữ thường

opt.cursorline = true -- Làm nổi bật dòng chứa con trỏ

-- Bật màu sắc đúng cho giao diện `tokyonight`
-- (Yêu cầu terminal hỗ trợ True Color như iTerm2 hoặc các terminal tương tự)
opt.termguicolors = true -- Hỗ trợ màu sắc 24-bit
opt.background = "dark" -- Cài đặt giao diện tối nếu có thể
opt.signcolumn = "yes" -- Hiển thị cột dấu hiệu (sign column) để tránh dịch chuyển văn bản

-- Cài đặt phím Backspace
opt.backspace = "indent,eol,start" -- Cho phép sử dụng backspace trên thụt lề, cuối dòng và vị trí bắt đầu chèn

-- Cài đặt clipboard
opt.clipboard:append("unnamedplus") -- Sử dụng clipboard hệ thống mặc định

-- Cài đặt chia cửa sổ
opt.splitright = true -- Khi chia cửa sổ dọc, mở cửa sổ mới bên phải
opt.splitbelow = true -- Khi chia cửa sổ ngang, mở cửa sổ mới bên dưới

-- Tắt tệp swap
opt.swapfile = false -- Không tạo tệp swap

