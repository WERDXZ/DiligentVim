return {
	{
		"mfussenegger/nvim-dap",
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{ "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "toggle breakpoint", mode = { "n" } },
			{ "<leader>dc", "<cmd>DapContinue<CR>",         desc = "continue",          mode = { "n" } },
			{ "<leader>do", "<cmd>DapStepOut<CR>",          desc = "step out",          mode = { "n" } },
			{ "<leader>di", "<cmd>DapStepInto<CR>",         desc = "step into",         mode = { "n" } },
			{ "<leader>dT", "<cmd>DapTerminate<CR>",        desc = "stop dap",          mode = { "n" } },
		},
	},

	{
		"rcarriga/nvim-dap-ui",
		keys = {
			{
				"<leader>dt",
				function()
					require("dapui").toggle()
				end,
				desc = "toggle DAP UI",
				mode = { "n" },
			},
		},
		config = function(_, _)
			require("dapui").setup()
		end,
	},
}
