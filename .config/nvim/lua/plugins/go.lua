return {
  {
    'olexsmir/gopher.nvim',
    cond = vim.g.vscode == nil,
    ft = 'go',
    -- branch = "develop"
    -- (optional) will update plugin's deps on every update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@type gopher.Config
    opts = {},
  },
}
