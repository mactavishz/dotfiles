return {
  -- automatically install formatters defined in conform
  'zapling/mason-conform.nvim',
  cond = vim.g.vscode == nil,
  dependencies = {
    'williamboman/mason.nvim',
    'stevearc/conform.nvim',
  },
  opts = {},
}
