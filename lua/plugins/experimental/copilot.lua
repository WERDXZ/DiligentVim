return {

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<c-cr>" } },
			panel = { enabled = true, keymap = { open = "<c-w>c" }},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
		},
		config =function (_,opts)
			require("copilot").setup(opts)
			vim.cmd[[Copilot enable]]
		end
	},
}
