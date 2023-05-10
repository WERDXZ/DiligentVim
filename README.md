# NeoVim-Config

This is my nvim configuration based on [neovim](https://neovim.io/)(~~What else could it based on?~~)
Click [here](#installation) to see the installation guide

## Installation 

First, archive your configuration:
```bash
# for MacOS or Linux
tar -czvf nvim.archive.tar.gz ~/.config/nvim 
rm -r ~/.config/nvim
```
And then clone this repo
```bash 
git clone https://github.com/WERDXZ/NeoVim-Config ~/.config/nvim
```

Finally, install the dependency(~~by whatever you want~~)
| name    | description                         |
| ------- | ----------------------------------- |
| [node.js](https://nodejs.org/en/) | for a lot of plugin and lsp to work |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | for telescope to grep faster:)      |
| [fd](https://github.com/sharkdp/fd)      | for telescope to find file faster   |
| [bat](https://github.com/sharkdp/bat)     | better preview                      |
| [fzf](https://github.com/junegunn/fzf)     | for fuzzy finder                    |  

## Usage 

### Key binds

In this configuration, I got WhichKey installed, which allows you to brows key binds via `:WhichKey` in normal mode.
I also got telescope installed to search all the key-binds via `<leader>sk`, verbose:

> `<leader>` is the key defined in `lua/config/options.lua` which is `\` in this case
> `s` is for search in my config context
> k stands for keys in this case

### Plugin Update and Sync

I use Lazy.nvim for lazy loading all plugins to make it start faster, you could toggle lazy panel by `<leader>l`, `:Lazy`, or `l` at startup page.

### Syntax highlighting

Treesitter is used for highlighting, many language are installed by default. To install a new language highlighter, type `:TSInstall <language>` where `<language>` is the name of the language.

### LSP Installation and DAP Installation

Install those via Mason: `:Mason` or `<leader>cm` 

### DAP Usage 

Use `<leader>dt` to toggle DAP ui.

### Terminal

Open a terminal via `<c-w>t` which is horizontal by default.
Use `<leader>th` to open a horizontal terminal.
Use `<leader>tv` to open a vertical terminal.
