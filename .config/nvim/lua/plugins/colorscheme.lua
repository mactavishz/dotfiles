return {
  "catppuccin/nvim",
  name = "catppuccin",
  cond = vim.g.vscode == nil,
  priority = 1000,
  opt = {
    flavour = "mocha",
    integrations = {
      cmp = true,
      blink_cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
  },
  {
    "Shatur/neovim-ayu",
    cond = vim.g.vscode == nil,
    opt = {},
    init = function()
      vim.cmd("colorscheme ayu")
    end,
  },
}
