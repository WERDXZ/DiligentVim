-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = "\\"

local opt = vim.opt

opt.expandtab = false -- use tab
opt.tabstop = 4
opt.shiftwidth = 4
opt.number = false -- no line numbers
opt.relativenumber = false -- no relative line numbers
opt.confirm = false
opt.list = false
