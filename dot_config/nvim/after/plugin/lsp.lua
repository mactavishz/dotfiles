local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer',
    'clangd',
    'jdtls',
    'gopls',
    'texlab',
    'pyright'
})


lsp.setup_nvim_cmp({
    mapping = lsp.defaults.cmp_mappings({
    }),
    sources = {
        { name = 'copilot' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    }
})

lsp.set_preferences({
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})

lsp.nvim_workspace()
-- more server configurations checkout: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
    vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>ref", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
})

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
