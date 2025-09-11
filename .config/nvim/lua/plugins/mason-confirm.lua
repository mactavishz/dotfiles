return {
  -- automatically install formatters defined in conform
  'zapling/mason-conform.nvim',
  cond = vim.g.vscode == nil,
  dependencies = {
    'mason-org/mason.nvim',
    'stevearc/conform.nvim',
  },
  opts = {},
}
