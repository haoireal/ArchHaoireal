return {
	"williamboman/mason.nvim", -- Plugin chính quản lý cài đặt các công cụ và máy chủ LSP
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- Kết hợp Mason với LSP
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Hỗ trợ cài đặt các công cụ bổ trợ
	},
	config = function()
		-- Import module mason
		local mason = require("mason")

		-- Import module mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- Import module mason-tool-installer
		local mason_tool_installer = require("mason-tool-installer")

		-- Kích hoạt Mason và cấu hình giao diện
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓", -- Biểu tượng khi gói đã được cài đặt
					package_pending = "➜", -- Biểu tượng khi gói đang được xử lý
					package_uninstalled = "✗", -- Biểu tượng khi gói chưa được cài đặt
				},
			},
			ensure_installed = { {
				"sumneko_lua",
			} },
		})

		-- Cấu hình Mason LSP Config
		mason_lspconfig.setup({
			automatic_installation = true, -- Bật tự động cài đặt các LSP khi cần thiết
			-- Danh sách các LSP server mà Mason sẽ tự động cài đặt
			ensure_installed = {
				"ts_ls", -- Hỗ trợ TypeScript/JavaScript
				"html", -- Hỗ trợ HTML
				"cssls", -- Hỗ trợ CSS
				"tailwindcss", -- Hỗ trợ TailwindCSS
				"svelte", -- Hỗ trợ Svelte
				"lua_ls", -- Hỗ trợ Lua
				"graphql", -- Hỗ trợ GraphQL
				"emmet_ls", -- Hỗ trợ Emmet
				"prismals", -- Hỗ trợ Prisma
				"pyright", -- Hỗ trợ Python
				"phpactor", -- PHP Suport
			},
		})

		-- Cấu hình Mason Tool Installer
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- Trình định dạng Prettier
				"stylua", -- Trình định dạng Lua
				"isort", -- Trình định dạng Python (sắp xếp import)
				"black", -- Trình định dạng Python
				"pylint", -- Trình kiểm tra mã Python
			},
		})
	end,
}
