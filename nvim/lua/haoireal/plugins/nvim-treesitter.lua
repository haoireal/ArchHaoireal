return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufReadPre",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"tsx",
					"typescript",
					"javascript",
					"html",
					"css",
					"vue",
					"astro",
					"svelte",
					"gitcommit",
					"graphql",
					"json",
					"json5",
					"lua",
					"markdown",
					"prisma",
					"vim",
				}, -- Các ngôn ngữ cần cài đặt
				auto_install = true, -- Tự động cài đặt parser khi mở file
				sync_install = false, -- Không cài đặt đồng bộ
				ignore_install = { "haskell" }, -- Bỏ qua parser của Haskell nếu lỗi
				modules = {}, -- Tránh cảnh báo thiếu trường 'modules'

				highlight = {
					enable = true, -- Bật tô màu cú pháp
					additional_vim_regex_highlighting = false, -- Không bật highlight mặc định của Vim
				},

				indent = {
					enable = true, -- Tự động căn chỉnh mã nguồn
				},

				incremental_selection = {
					enable = true, -- Bật tính năng chọn theo cấp độ
					keymaps = {
						init_selection = "<leader>gnn",
						node_incremental = "<leader>gnr",
						scope_incremental = "<leader>gne",
						node_decremental = "<leader>gnt",
					},
				},

				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = { query = "@call.outer", desc = "Next function call start" },
							["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
							["]l"] = { query = "@loop.outer", desc = "Next loop start" },

							-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
							-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
							["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]F"] = { query = "@call.outer", desc = "Next function call end" },
							["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
							["]L"] = { query = "@loop.outer", desc = "Next loop end" },
						},
						goto_previous_start = {
							["[f"] = { query = "@call.outer", desc = "Prev function call start" },
							["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
							["[c"] = { query = "@class.outer", desc = "Prev class start" },
							["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
							["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
						},
						goto_previous_end = {
							["[F"] = { query = "@call.outer", desc = "Prev function call end" },
							["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
							["[C"] = { query = "@class.outer", desc = "Prev class end" },
							["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
							["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
						},
					},
				},

				rainbow = {
					enable = true, -- Bật tính năng mở ngoặc cầu vồng
					extended_mode = true, -- Hỗ trợ cả các ký tự như `<>`, `""`, `''`
					max_file_lines = 1000, -- Giới hạn số dòng áp dụng
				},
			})
		end,
		dependencies = {
			"hiphish/rainbow-delimiters.nvim", -- Hỗ trợ tô màu mở ngoặc cầu vồng
			"JoosepAlviste/nvim-ts-context-commentstring", -- Hỗ trợ comment thông minh
			"nvim-treesitter/nvim-treesitter-textobjects", -- Hỗ trợ textobjects
		},
	},
}
