vim.g.mapleader = " " -- Đặt phím "leader" là khoảng trắng

local keymap = vim.keymap -- Đặt biến `keymap` để sử dụng ngắn gọn hơn

-- Chế độ insert: nhấn "jk" để thoát insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Thoát chế độ insert bằng jk" })

-- Chế độ normal: xóa highlight tìm kiếm
keymap.set("n", "<Esc>", ":nohl<CR>", { desc = "Xóa highlight tìm kiếm" })

-- Tăng/giảm số

-- Quản lý cửa sổ
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Chia cửa sổ theo chiều dọc" }) -- chia cửa sổ theo chiều dọc
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Chia cửa sổ theo chiều ngang" }) -- chia cửa sổ theo chiều ngang
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Đặt kích thước các cửa sổ bằng nhau" }) -- làm các cửa sổ kích thước bằng nhau
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Đóng cửa sổ hiện tại" }) -- đóng cửa sổ hiện tại

-- Quản lý tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Mở tab mới" }) -- mở tab mới
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Đóng tab hiện tại" }) -- đóng tab hiện tại
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Chuyển sang tab tiếp theo" }) -- chuyển sang tab tiếp theo
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Chuyển sang tab trước đó" }) -- chuyển sang tab trước đó
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Mở buffer hiện tại trong tab mới" }) -- chuyển buffer hiện tại vào tab mới

-- Hot key managerr
-- Keymap để lưu file và quay lại chế độ normal
keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true }) -- Normal mode
keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true }) -- Insert mode
keymap.set("v", "<C-s>", ":w<CR>", { noremap = true, silent = true }) -- Visual mode

--
