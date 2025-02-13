-- Show a box real color in css
return {
	"NvChad/nvim-colorizer.lua",
	enabled = false,
	event = "VeryLazy", -- https://github.com/NvChad/nvim-colorizer.lua/issues/57
	-- event = { "BufReadPost", "BufNewFile" },
	opts = {
		filetypes = {
			"*",
			css = { names = true, css = true, css_fn = true },
		},
		user_default_options = {
			-- mode = "background",
			-- names = false,
			tailwindcss = true,
			--
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = true, -- "Name" codes like Blue or blue
			RRGGBBAA = false, -- #RRGGBBAA hex codes
			AARRGGBB = false, -- 0xAARRGGBB hex codes
			rgb_fn = false, -- CSS rgb() and rgba() functions
			hsl_fn = false, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Available modes for `mode`: foreground, background,  virtualtext
			mode = "background", -- Set the display mode.
			-- Available methods are false / true / "normal" / "lsp" / "both"
			-- True is same as normal
			tailwind = "both", -- Enable tailwind colors
			-- parsers can contain values used in |user_default_options|
			sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
			virtualtext = "■",
			-- update color values even if buffer is not focused
			-- example use: cmp_menu, cmp_docs
			always_update = false,
		},
	},
}
