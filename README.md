# nvim-config-switcher

A simple Neovim plugin to switch between branches of your configuration repository and reload Neovim.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    'XDead27/nvim-config-switcher',
    config = function()
        -- Optional: Add keymaps
        vim.api.nvim_set_keymap('n', '<leader>sb', ':ShowBranch<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>sw', ':SwitchBranch<CR>', { noremap = true, silent = true })
    end
}

