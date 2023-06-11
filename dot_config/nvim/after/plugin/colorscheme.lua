if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

    -- nightfly, moonfly, tokyonight, tokyodark, github_dark, github_dimmed, github_dark_default, github_light, github_light_default
    vim.api.nvim_cmd({
        cmd = 'colorscheme',
        args = { 'catppuccin' }
    }, {})
end
