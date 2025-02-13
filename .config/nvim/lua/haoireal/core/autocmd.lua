-- NOTE: Autocommands
-- Tạo một nhóm autocommand và áp dụng cài đặt formatoptions
vim.api.nvim_create_augroup("DisableAutoComment", {})
vim.api.nvim_create_autocmd("BufEnter", {
	group = "DisableAutoComment",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Cấu hình autoformat khi lưu file
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.js", "*.ts", "*.jsx", "*.tsx" }, -- Định dạng với ESLint cho các file JS/TS
	callback = function()
		vim.lsp.buf.format({ async = true }) -- Gọi lệnh format khi lưu file
	end,
})
