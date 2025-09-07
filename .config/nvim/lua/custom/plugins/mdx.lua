return {
  'davidmh/mdx.nvim',
  cond = vim.g.vscode == nil,
  config = true,
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
}
