local utils = require('nvim-config-switch.utils')

-- Show the current branch
local function show_current_branch()
    local branch = utils.get_current_branch()
    vim.notify("Current branch: " .. branch, vim.log.levels.INFO)
end

-- Show all branches and prompt to switch
local function switch_branch()
    local branches = utils.get_branches()
    local choice = vim.fn.inputlist(vim.split(branches, '\n'))

    -- Ensure the user made a valid choice
    if choice > 0 then
        local branch_name = vim.split(branches, '\n')[choice]:gsub("%*", ""):gsub("%s+", "")
        utils.checkout_branch(branch_name)
        vim.notify("Switched to branch: " .. branch_name, vim.log.levels.INFO)
        vim.cmd("source ~/.config/nvim/init.lua")  -- Reload Neovim configuration
        vim.notify("Neovim reloaded!", vim.log.levels.INFO)
    end
end

-- Expose commands for branch display and switching
vim.api.nvim_create_user_command('ShowBranch', show_current_branch, {})
vim.api.nvim_create_user_command('SwitchBranch', switch_branch, {})
