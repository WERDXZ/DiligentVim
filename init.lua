-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd('command! Getrootdir lua require("config.utils").get_lsp_root_dir()')
