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
		lazy = true,
	},
	{
		"jacoborus/tender.vim",
		lazy = true,
	}

}
