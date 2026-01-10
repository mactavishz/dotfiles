return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    cond = vim.g.vscode == nil,
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    opts = {
      preset = "classic", -- "classic" or "modern"
      transparent_bg = true,
      options = {
        use_icons_from_diagnostic = false,
        throttle = 0,
        multiple_diag_under_cursor = true,
        multilines = {
          enabled = true,
          always_show = true,
        },
        show_all_diags_on_cursorline = false,
        enable_on_insert = true,
        enable_on_select = true,
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      -- vim.diagnostic.config { virtual_text = false } -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
}
