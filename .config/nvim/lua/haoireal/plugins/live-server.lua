return {

	-- Cấu hình plugin Live Server
	{
		"barrett-ruth/live-server.nvim",
		config = function()
			require("live-server").setup() -- Cấu hình mặc định
		end,
	},
}
