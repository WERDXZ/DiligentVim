-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local unmap = vim.api.nvim_del_keymap
local map = vim.api.nvim_set_keymap

-- Unmap something
unmap("n", "<C-h>")
unmap("n", "<C-j>")
unmap("n", "<C-k>")
unmap("n", "<C-l>")

unmap("n", "<C-UP>")
unmap("n", "<C-DOWN>")
unmap("n", "<C-LEFT>")
unmap("n", "<C-RIGHT>")

unmap("n", "<leader>`")

unmap("n", "<leader>-")
unmap("n", "<leader>|")

unmap("n", "<leader>uf")
unmap("n", "<leader>ud")

unmap("n", "<S-l>")
unmap("n", "<S-h>")

unmap("t", "<esc><esc>")

map("n","<esc>","<CMD>lua require(\"config.utils\").better_esc()<CR>",{
	noremap = true,
	silent = true,
})

map("t","<esc>","<C-\\><C-n><CMD>lua require(\"config.utils\").better_esc()<CR>",{
	noremap = true,
	silent = true,
})
