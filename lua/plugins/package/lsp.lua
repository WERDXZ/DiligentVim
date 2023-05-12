return{
	{"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = true },
			{ "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
			{"williamboman/mason-lspconfig.nvim"},
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	}
}
