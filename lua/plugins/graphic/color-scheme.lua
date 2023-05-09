return {

	-- tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = { style = "night" },
		init = function()
			vim.cmd[[colorscheme tokyonight-night]]
		end
	},
	{
		"catppuccin/nvim",
		lazy = false,
	},
	{
		"jacoborus/tender.vim",
		lazy = false,
	}

}
