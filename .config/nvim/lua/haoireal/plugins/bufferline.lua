return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- Hiển thị buffer dưới dạng tab
				numbers = "ordinal", -- Hiển thị số thứ tự của tab
				close_command = "bdelete! %d", -- Lệnh đóng tab
				right_mouse_command = "bdelete! %d", -- Đóng tab bằng chuột phải
				show_buffer_close_icons = true, -- Hiển thị icon đóng tab
				show_close_icon = false, -- Không cần icon đóng chính
				separator_style = "slant", -- Kiểu phân cách giữa các tab ("slant", "thick", "thin")
				diagnostics = "nvim_lsp", -- Hiển thị lỗi từ LSP
				offsets = {
					{ filetype = "NvimTree", text = "File Explorer", text_align = "center" },
				},
			},
		})

		--setkeynap
		local keymap = vim.keymap -- for conciseness

		-- Chuyển giữa các tab
		keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
		keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

		-- Đóng tab
		keymap.set("n", "<leader>bc", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
		keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })

		-- Di chuyển trực tiếp đến tab tương ứng bằng Ctrl + số
		keymap.set("n", "<C-1>", "<cmd>BufferLineGoToBuffer 1<CR>", { desc = "Go to buffer 1" })
		keymap.set("n", "<C-2>", "<cmd>BufferLineGoToBuffer 2<CR>", { desc = "Go to buffer 2" })
		keymap.set("n", "<C-3>", "<cmd>BufferLineGoToBuffer 3<CR>", { desc = "Go to buffer 3" })
		keymap.set("n", "<C-4>", "<cmd>BufferLineGoToBuffer 4<CR>", { desc = "Go to buffer 4" })
		keymap.set("n", "<C-5>", "<cmd>BufferLineGoToBuffer 5<CR>", { desc = "Go to buffer 5" })
		keymap.set("n", "<C-6>", "<cmd>BufferLineGoToBuffer 6<CR>", { desc = "Go to buffer 6" })
		keymap.set("n", "<C-7>", "<cmd>BufferLineGoToBuffer 7<CR>", { desc = "Go to buffer 7" })
		keymap.set("n", "<C-8>", "<cmd>BufferLineGoToBuffer 8<CR>", { desc = "Go to buffer 8" })
		keymap.set("n", "<C-9>", "<cmd>BufferLineGoToBuffer 9<CR>", { desc = "Go to buffer 9" })
	end,
}
