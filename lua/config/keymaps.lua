-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local unmap = vim.api.nvim_del_keymap
local map = vim.api.nvim_set_keymap

map("n","<esc>","<CMD>lua require(\"config.utils\").better_esc()<CR>",{
	noremap = true,
	silent = true,
})

map("t","<esc>","<C-\\><C-n><CMD>lua require(\"config.utils\").better_esc()<CR>",{
	noremap = true,
	silent = true,
})
