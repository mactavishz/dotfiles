local status_ok, persisted = pcall(require, 'persisted')
if not status_ok then
    return
end

persisted.setup({
    autosave = true,
    autoload = true,
    use_git_branch = true,
    should_autosave = function()
        -- do not autosave if the alpha dashboard is the current filetype
        if vim.bo.filetype == "alpha" then
            return false
        end
        return true
    end,
})

require("telescope").load_extension("persisted")

local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "PersistedSavePre",
    group = group,
    callback = function()
        vim.cmd("Neotree close")
    end,
})

vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "PersistedTelescopeLoadPre",
    group = group,
    callback = function()
        -- Close all open buffers
        -- Thanks to https://github.com/avently
        vim.api.nvim_input("<ESC>:%bd<CR>")
    end,
})

vim.api.nvim_create_autocmd({ "User" }, {
    pattern = "PersistedTelescopeLoadPost",
    group = group,
    callback = function(session)
        print("Loaded session " .. session.name)
    end,
})

vim.keymap.set("n", "<leader>ss", "<cmd>Telescope persisted<cr>")
