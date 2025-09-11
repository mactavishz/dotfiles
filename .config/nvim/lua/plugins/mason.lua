return {
  'mason-org/mason-lspconfig.nvim',
  opts = {},
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
  config = function()
    -- matches the lsp configs in the lsp folder
    local ensure_installed = {
      'clangd',
      'gopls',
      'bashls',
      'pyright',
      'ruff',
      'rust_analyzer',
      'ts_ls',
      'yamlls',
      'lua_ls',
    }
    require('mason-lspconfig').setup {
      ensure_installed = ensure_installed,
      automatic_enable = true, -- Mason-LSPConfig v2 auto-enables servers by default
    }
  end,
}
