return {
	"folke/noice.nvim",
	event = "VeryLazy", -- Tải plugin khi Neovim khởi động ở chế độ nhàn rỗi
	dependencies = {
		"MunifTanjim/nui.nvim", -- Thư viện UI cần thiết
		"rcarriga/nvim-notify", -- Plugin thông báo tích hợp
	},
	config = function()
		-- Cấu hình noice.nvim
		require("noice").setup({
			-- Cấu hình dòng lệnh
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "", lang = "bash" },
					lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
				},
			},
			-- Cấu hình thông báo
			messages = {
				enabled = true,
				view = "notify", -- Sử dụng giao diện thông báo
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
			},
			-- Cấu hình menu popup
			popupmenu = {
				enabled = true,
				backend = "nui",
			},
			-- Cấu hình LSP
			lsp = {
				progress = {
					enabled = true,
					format = { "{spinner} {progress}%", hl_group = "NoiceLspProgress" },
					throttle = 1000 / 60,
					view = "mini",
				},
				hover = { enabled = true },
				signature = { enabled = true },
				message = { enabled = true },
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- Cấu hình thông báo
			notify = {
				enabled = true,
				view = "notify",
			},
			-- Cấu hình các view popup
			views = {
				cmdline_popup = {
					border = {
						style = "rounded",
						text = { top = " Dòng Lệnh " },
					},
					position = { row = 5, col = "50%" },
					size = { width = 60, height = "auto" },
				},
				popupmenu = {
					relative = "editor",
					border = {
						style = "rounded",
						text = { top = " Chọn " },
					},
					position = { row = 10, col = "50%" },
					size = { width = 40, height = 10 },
				},
				notify = {
					background_colour = "#282c34",
				},
			},
			routes = {
				{
					filter = { event = "msg_show", kind = "", find = "written" },
					opts = { skip = true },
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
		})

		-- Cấu hình notify.nvim
		require("notify").setup({
			background_colour = "#282c34",
			stages = "fade_in_slide_out",
			timeout = 3000,
			render = "minimal",
			max_width = 50,
			max_height = 10,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { border = "rounded" })
			end,
		})

		-- Tích hợp với nvim-notify (nếu đang sử dụng)
		vim.notify = require("notify")
	end,
}
