# NeoVim-Config

This is my NeoVim configuration based on [NeoVim](https://neovim.io/). Click [here](#installation) to see the installation guide.

## Installation 

Before installing, make sure to install a terminal with true color support (such as iTerm2), or else it will look very ugly.

First, archive your configuration:
```bash
# for MacOS or Linux
tar -czvf nvim.archive.tar.gz ~/.config/nvim 
rm -r ~/.config/nvim
```
Then, clone this repository:
```bash 
git clone https://github.com/WERDXZ/NeoVim-Config ~/.config/nvim
```

Finally, install the following dependencies:
| Name    | Description                         |
| ------- | ----------------------------------- |
| [Node.js](https://nodejs.org/en/) | Required for many plugins and LSP to work |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Faster grep for Telescope      |
| [fd](https://github.com/sharkdp/fd)      | Faster file finding for Telescope   |
| [bat](https://github.com/sharkdp/bat)     | Better preview                      |
| [fzf](https://github.com/junegunn/fzf)     | Fuzzy finder                    |  

## Usage 

### Key Bindings

This configuration includes WhichKey, which allows you to browse
