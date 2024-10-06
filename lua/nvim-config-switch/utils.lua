local M = {}

-- Get the current branch of the Git repository
M.get_current_branch = function()
    local handle = io.popen("git -C ~/.config/nvim rev-parse --abbrev-ref HEAD")
    local result = handle:read("*a")
    handle:close()
    return result:gsub("\n", "")
end

-- Get the list of branches in the Git repository
M.get_branches = function()
    local handle = io.popen("git -C ~/.config/nvim branch --all")
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Checkout a specific branch
M.checkout_branch = function(branch_name)
    os.execute("git -C ~/.config/nvim checkout " .. branch_name)
end

return M
