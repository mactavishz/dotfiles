-- Health check for the neovim configuration
local M = {}

function M.check_all()
    print("═══════════════════════════════════")
    print("      NEOVIM CONFIGURATION HEALTH   ")
    print("═══════════════════════════════════")
    print("")

    -- Check LSP status
    print("󰒋 LSP STATUS:")
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = bufnr })
    if #clients > 0 then
        for _, client in ipairs(clients) do
            print("  ✓ " .. client.name .. " (ID: " .. client.id .. ")")
        end
    else
        print("  ⚠ No LSP clients attached to current buffer")
    end
    print("")

        -- Check key plugins
    print("📦 KEY PLUGINS:")
    local plugins_to_check = {
        { name = "mason",      module = "mason" },
        { name = "conform",    module = "conform" },
        { name = "treesitter", module = "nvim-treesitter" },
    }

    for _, plugin in ipairs(plugins_to_check) do
        local ok, _ = pcall(require, plugin.module)
        if ok then
            print("  ✓ " .. plugin.name)
        else
            print("  ✗ " .. plugin.name .. " (not loaded)")
        end
    end
    print("")
end

-- Create user command
vim.api.nvim_create_user_command('HealthCheck', M.check_all, { desc = "Run configuration health check" })

return M
