return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- nguồn dữ liệu cho văn bản trong bộ đệm
		"hrsh7th/cmp-path", -- nguồn dữ liệu cho các đường dẫn hệ thống tệp
		{
			"L3MON4D3/LuaSnip",
			-- theo phiên bản phát hành mới nhất.
			version = "v2.*", -- Thay <CurrentMajor> bằng phiên bản lớn mới nhất (số đầu tiên trong phiên bản phát hành mới nhất)
			-- cài đặt jsregexp (tùy chọn!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- để tự động hoàn thành
		"rafamadriz/friendly-snippets", -- các snippet hữu ích
		"onsails/lspkind.nvim", -- pictogram giống như trong vscode
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- tải các snippet theo phong cách vscode từ các plugin đã cài đặt (ví dụ: friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- cấu hình cách nvim-cmp tương tác với engine snippet
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- gợi ý trước
				["<Tab>"] = cmp.mapping.select_next_item(), -- gợi ý tiếp theo
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- hiển thị các gợi ý hoàn thành
				["<C-e>"] = cmp.mapping.abort(), -- đóng cửa sổ hoàn thành
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- các nguồn dữ liệu cho tự động hoàn thành
			sources = cmp.config.sources({
				{ name = "codeium" }, -- Thêm Codeium vào nvim-cmp
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- văn bản trong bộ đệm hiện tại
				{ name = "path" }, -- các đường dẫn hệ thống tệp
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			-- cấu hình lspkind cho các pictogram giống vscode trong menu hoàn thành
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
		-- Cấu hình Codeium
		vim.g.codeium_enabled = true
		vim.g.codeium_socket_path = "/tmp/codeium.sock" -- Thêm đường dẫn đến socket Codeium nếu cần
	end,
}
