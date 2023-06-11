local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
    return
end

neotree.setup({
    default_component_configs = {
        icon = {
            folder_empty = "󰜌",
            folder_empty_open = "󰜌",
        },
        git_status = {
            symbols = {
                renamed  = "󰁕",
                unstaged = "󰄱",
            },
        },
    },
    document_symbols = {
        kinds = {
            File = { icon = "󰈙", hl = "Tag" },
            Namespace = { icon = "󰌗", hl = "Include" },
            Package = { icon = "󰏖", hl = "Label" },
            Class = { icon = "󰌗", hl = "Include" },
            Property = { icon = "󰆧", hl = "@property" },
            Enum = { icon = "󰒻", hl = "@number" },
            Function = { icon = "󰊕", hl = "Function" },
            String = { icon = "󰀬", hl = "String" },
            Number = { icon = "󰎠", hl = "Number" },
            Array = { icon = "󰅪", hl = "Type" },
            Object = { icon = "󰅩", hl = "Type" },
            Key = { icon = "󰌋", hl = "" },
            Struct = { icon = "󰌗", hl = "Type" },
            Operator = { icon = "󰆕", hl = "Operator" },
            TypeParameter = { icon = "󰊄", hl = "Type" },
            StaticMethod = { icon = '󰠄 ', hl = 'Function' },
        }
    },
    sources = { "filesystem", "git_status", "document_symbols" },
    source_selector = {
        winbar = true,
        statusline = false,
        sources = {
            { source = "filesystem",       display_name = "󰉓 Files " },
            { source = "git_status",       display_name = "󰊢 Git " },
            { source = "document_symbols", display_name = "󰆧 Symbols" },
        },
    },
    window = {
        width = 30
    }
})

local opts = { silent = true, noremap = true }

vim.keymap.set("n", "<C-n>", "<cmd>Neotree<cr>", opts)
