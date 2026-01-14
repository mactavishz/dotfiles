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
    config = function()
      require("ayu").setup({
        mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        terminal = true, -- Set to `false` to let terminal manage its own colors.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      })
    end,
    init = function()
      vim.cmd("colorscheme ayu")
    end,
  },
}
