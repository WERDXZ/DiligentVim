return {
	{
		"akinsho/toggleterm.nvim",
		opts = {},
		keys = {
			{  "<c-w>t", "<cmd>exe v:count1 . \"ToggleTerm\"<CR>", desc = "toggle Terminal", mode = {"n"} },
			{  "<leader>th",
				-- terminal horizontal
				"<cmd>exe v:count1 . \"ToggleTerm direction=horizontal\"<CR>i",
				desc = "toggle Terminal horizontal",
				mode = {"n"}
			},
			{
				"<leader>tv",
				-- terminal vertically
				"<cmd>exe v:count1 . \"ToggleTerm direction=vertical\"<CR>i",
				desc = "toggle Terminal vertically",
				mode = {"n"}
			},
		},
		cmd = "ToggleTerm",
	}
}
