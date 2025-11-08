return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    -- With this we don't have to call require("mason").setup()
    { 'mason-org/mason.nvim', opts = {} },
    {
      'neovim/nvim-lspconfig',
      dependencies = {
        { 'j-hui/fidget.nvim', opts = {} },
      },
    },
  },
  config = function()
    -- Automatically detect LSP configs from lsp folder
    local lsp_utils = require('utils.lsp_utils')
    local ensure_installed = lsp_utils.get_mason_lsp_list()
    
    require('mason-lspconfig').setup {
      ensure_installed = ensure_installed,
      automatic_enable = true, -- Mason-LSPConfig v2 auto-enables servers by default
    }
  end,
}
