return {

	-- Better `vim.notify()`
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				diagnostics_indicator = function(_, _, diag)
					local icons = require("lazyvim.config").icons.diagnostics
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
						.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		keys = {
			{
				"<S-h>",
				"<cmd>BufferLineCyclePrev<CR>",
				desc = "Previous Buffer",
				mode = { "n" },
			},
			{
				"<S-l>",
				"<cmd>BufferLineCycleNext<CR>",
				desc = "Next Buffer",
				mode = { "n" },
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(plugin)
			local icons = require("lazyvim.config").icons

			local function fg(name)
				return function()
					---@type {foreground?:number}?
					local hl = vim.api.nvim_get_hl_by_name(name, true)
					return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
				end
			end

			return {
				options = {
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"diagnostics",
							symbols = {
								error = icons.diagnostics.Error,
								warn = icons.diagnostics.Warn,
								info = icons.diagnostics.Info,
								hint = icons.diagnostics.Hint,
							},
						},
						{
							"filetype",
							icon_only = true,
							separator = "",
							padding = {
								left = 1,
								right = 0,
							},
						},
						{ "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
					},
					lualine_x = {
						{
							function()
								return require("noice").api.status.command.get()
							end,
							cond = function()
								return package.loaded["noice"] and require("noice").api.status.command.has()
							end,
							color = fg("Statement"),
						},

						{
							"diff",
							symbols = {
								added = icons.git.added,
								modified = icons.git.modified,
								removed = icons.git.removed,
							},
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "neo-tree" },
			}
		end,
	},
	{
		"folke/noice.nvim",
		event = "VimEnter",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		-- stylua: ignore
		keys = {
			{
				"<S-Enter>",
				function() require("noice").redirect(vim.fn.getcmdline()) end,
				mode = "c",
				desc =
				"Redirect Cmdline"
			},
			{
				"<leader>snl",
				function() require("noice").cmd("last") end,
				desc =
				"Noice Last Message"
			},
			{
				"<leader>snh",
				function() require("noice").cmd("history") end,
				desc =
				"Noice History"
			},
			{
				"<leader>sna",
				function() require("noice").cmd("all") end,
				desc =
				"Noice All"
			},
			{
				"<c-f>",
				function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,
				silent = true,
				expr = true,
				desc =
				"Scroll forward",
				mode = {
					"i", "n", "s" }
			},
			{
				"<c-b>",
				function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end,
				silent = true,
				expr = true,
				desc =
				"Scroll backward",
				mode = {
					"i", "n", "s" }
			},
		},
	},
	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},
}
