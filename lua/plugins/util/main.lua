return {
	---------------------------------------------------------------
	-- Utilities & Tools
	---------------------------------------------------------------
	---- general
	{ "LazyVim/LazyVim" }, -- Package manager
	{ "akinsho/toggleterm.nvim" }, -- terminal

	---- explorer
	{ "nvim-telescope/telescope.nvim"}, -- Telescope
	{ "folke/which-key.nvim" }, -- which-key
	{ "nvim-neo-tree/neo-tree.nvim"}, -- file explorer
	{ "folke/trouble.nvim" }, -- lsp diagnostic explorer
	{ "stevearc/aerial.nvim" }, -- syntax tree explorer

	---- lsp
	{ "neovim/nvim-lspconfig" }, -- Configurations for Nvim LSP
	{ "jose-elias-alvarez/null-ls.nvim"}, -- null-ls
	{ "williamboman/mason.nvim"},

	---- completion
	{ "hrsh7th/nvim-cmp"}, -- completion

	---- tools
	-- 	{ "echasnovski/mini.nvim", version = false },
	{ "folke/neoconf.nvim" }, -- config manager
	{ "folke/neodev.nvim" }, -- set dev env for neovim config
	{ "windwp/nvim-autopairs" }, -- pair n tags
	{ "windwp/nvim-ts-autotag" }, -- typescript tags
	{ "akinsho/toggleterm.nvim" }, -- terminal
	{ "folke/persistence.nvim" }, -- session managements
	{ "numToStr/Comment.nvim" }, -- comments


	---- syntax
	{ "nvim-treesitter/nvim-treesitter"}, -- syntax highlighting

	---- dap 
	{"mfussenegger/nvim-dap"},
	{"theHamsta/nvim-dap-virtual-text"},
	{"rcarriga/nvim-dap-ui"},
	{"jay-babu/mason-nvim-dap.nvim"},

	---- other
}
