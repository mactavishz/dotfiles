local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

lazy.setup({
    -- Have packer manage itself
    'wbthomason/packer.nvim',
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = vim.fn.executable 'make' == 1
    },
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'nvim-treesitter/playground',
    'j-hui/fidget.nvim',
    -- Buffer mark and navigation
    'theprimeagen/harpoon',
    -- Undo history
    'mbbill/undotree',
    -- Colorschemes
    {
        'catppuccin/nvim',
        name = 'catppuccin'
    },

    -- LSP related
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip', },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    'nvim-lua/popup.nvim',
    'windwp/nvim-autopairs',
    'numToStr/Comment.nvim',
    'kyazdani42/nvim-web-devicons',
    -- Bufferline alternative
    {
        'romgrk/barbar.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    'nvim-lualine/lualine.nvim',
    'gpanders/editorconfig.nvim',
    'lewis6991/impatient.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'goolord/alpha-nvim',

    'tpope/vim-repeat',
    {
        'kylechui/nvim-surround',
        version = '*', -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- use 'phaazon/hop.nvim'
    'ggandor/leap.nvim',

    'ThePrimeagen/vim-be-good',
    'olimorris/persisted.nvim',

    -- for formatters and linters
    'jose-elias-alvarez/null-ls.nvim',
    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons'
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    {
        'folke/lsp-colors.nvim',
        config = function()
            require('lsp-colors').setup({
                Error = '#db4b4b',
                Warning = '#e0af68',
                Information = '#0db9d7',
                Hint = '#10B981'
            })
        end
    },

    -- Tabnine
    -- {
    --     'tzachar/cmp-tabnine',
    --     build = './install.sh',
    --     dependencies = 'hrsh7th/nvim-cmp'
    -- },

    -- Copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    },
    -- Copilot cmp
    {
        "zbirenbaum/copilot-cmp",
        dependencies = "zbirenbaum/copilot.lua",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    -- Git
    'lewis6991/gitsigns.nvim'
})
