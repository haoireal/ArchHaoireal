return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Thiết lập các linters theo filetype
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		-- Chỉnh tham số cho eslint_d
		lint.linters.eslint_d.args = {
			"--no-warn-ignored", -- Không hiển thị các file bị ignore
			"--format",
			"json", -- Định dạng đầu ra là JSON
			"--stdin", -- Đọc nội dung từ stdin
			"--stdin-filename", -- Gửi đường dẫn file đang xử lý
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		-- Tạo autogroup cho lint
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- Bọc hàm lint.try_lint để bắt lỗi nếu có
				local ok, err = pcall(lint.try_lint)
				if not ok then
					vim.notify("Linting error: " .. err, vim.log.levels.ERROR)
				end
			end,
		})

		-- Thêm keymap để kích hoạt linting thủ công
		vim.keymap.set("n", "<leader>l", function()
			local ok, err = pcall(lint.try_lint)
			if not ok then
				vim.notify("Linting error: " .. err, vim.log.levels.ERROR)
			else
				vim.notify("Linting complete", vim.log.levels.INFO)
			end
		end, { desc = "Trigger linting for current file" })
	end,
}
