return {
  'Bekaboo/dropbar.nvim',
  cond = vim.g.vscode == nil,
  -- optional, but required for fuzzy finder support
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
  },
}
