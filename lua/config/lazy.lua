require("config.bootstrap")
require("config.keymaps")
require("config.autocmds")
require("config.options")
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lib" },
		{ import = "plugins.util" },
		{ import = "plugins.graphic" },
		{ import = "plugins.experimental" },
		{ import = "plugins.dependent" },
		{ import = "plugins.package" }
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = true,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	install = { colorscheme = { "tokyonight", "night" } },
	checker = { enabled = true }, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
