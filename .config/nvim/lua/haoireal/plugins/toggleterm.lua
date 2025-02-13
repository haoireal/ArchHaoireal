-- Create a pop-up terminal
return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-\>]], -- Phím tắt mở terminal (Ctrl+\)
			direction = "float", -- Hiển thị terminal dạng popup
			float_opts = {
				border = "rounded", -- Bo viền terminal
				winblend = 10, -- Độ trong suốt
			},
		})

		-- Tùy chỉnh kết hợp với noice
		local Terminal = require("toggleterm.terminal").Terminal
		local custom_terminal = Terminal:new({
			cmd = "zsh", -- Thay đổi thành shell bạn muốn (bash, zsh, etc.)
			hidden = true,
			direction = "float",
			float_opts = {
				border = "rounded",
				winblend = 0,
			},
		})

		-- Tạo phím tắt mở custom terminal
		vim.keymap.set("n", "<leader>tt", function()
			custom_terminal:toggle()
		end, { noremap = true, silent = true, desc = "Open Popup Terminal" })
	end,
}
