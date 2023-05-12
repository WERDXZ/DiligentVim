return {

	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = true, auto_trigger = true, keymap = { accept = "<c-cr>" } },
			panel = { enabled = true, keymap = { open = "<leader>cc" } },
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
		config = function(_, opts)
			require("copilot").setup(opts)
			vim.cmd([[Copilot enable]])
		end,
	},

	{
		"jackMort/ChatGPT.nvim",
		cmd = {"ChatGPT","ChatGPTEditWithInstructions","ChatGPTRun"},
		keys = {
			{
				"<leader>cc", function ()
					require("chatgpt").edit_with_instructions()
				end,
				desc = "Edit with instructions",
				mode = {"v","n"}
			}
		},
		opts = {
			api_key_cmd = os.getenv("OPENAI_API_KEY"),
			yank_register = "+",
			edit_with_instructions = {
				diff = false,
				keymaps = {
					accept = "<C-e>",
					toggle_diff = "<C-d>",
					toggle_settings = "<C-o>",
					cycle_windows = "<Tab>",
					use_output_as_input = "<C-r>",
					close = { "<C-q>" },
				},
			},
			chat = {
				welcome_message = "ChatGPT",
				loading_text = "Loading, please wait ...",
				question_sign = "",
				answer_sign = "ﮧ",
				max_line_length = 120,
				sessions_window = {
					border = {
						style = "rounded",
						text = {
							top = " Sessions ",
						},
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
					},
				},
				keymaps = {
					close = { "<C-q>" },
					yank_last = "<C-y>y",
					yank_last_code = "<C-y>c",
					scroll_up = "<C-k>",
					scroll_down = "<C-j>",
					new_session = "<C-j>",
					cycle_windows = "<Tab>",
					cycle_modes = "<C-e>",
					select_session = "<Space>",
					rename_session = "r",
					delete_session = "d",
					draft_message = "<C-d>",
					toggle_settings = "<C-o>",
					toggle_message_role = "<C-r>",
					toggle_system_role_open = "<C-s>",
				},
			},
			popup_layout = {
				default = "center",
				center = {
					width = "80%",
					height = "80%",
				},
				right = {
					width = "30%",
					width_settings_open = "50%",
				},
			},
			popup_window = {
				border = {
					highlight = "FloatBorder",
					style = "rounded",
					text = {
						top = " ChatGPT ",
					},
				},
				win_options = {
					wrap = true,
					linebreak = true,
					foldcolumn = "1",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
				buf_options = {
					filetype = "markdown",
				},
			},
			system_window = {
				border = {
					highlight = "FloatBorder",
					style = "rounded",
					text = {
						top = " SYSTEM ",
					},
				},
				win_options = {
					wrap = true,
					linebreak = true,
					foldcolumn = "2",
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},
			popup_input = {
				prompt = "  ",
				border = {
					highlight = "FloatBorder",
					style = "rounded",
					text = {
						top_align = "center",
						top = " Prompt ",
					},
				},
				win_options = {
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
				submit = "<C-Enter>",
				submit_n = "<Enter>",
			},
			settings_window = {
				border = {
					style = "rounded",
					text = {
						top = " Settings ",
					},
				},
				win_options = {
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},
			openai_params = {
				model = "gpt-3.5-turbo",
				frequency_penalty = 0,
				presence_penalty = 0,
				max_tokens = 300,
				temperature = 0,
				top_p = 1,
				n = 1,
			},
			openai_edit_params = {
				model = "code-davinci-edit-001",
				temperature = 0,
				top_p = 1,
				n = 1,
			},
			actions_paths = {},
			show_quickfixes_cmd = "Trouble quickfix",
			predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
