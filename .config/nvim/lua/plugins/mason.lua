-- Thanks to: https://www.youtube.com/watch?v=yI9R13h9IEE
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      {
        "neovim/nvim-lspconfig",
        dependencies = {
          { "j-hui/fidget.nvim", opts = {} },
        },
      },
      -- With this we don't have to call require("mason").setup()
      { "mason-org/mason.nvim", opts = {} },
      -- With this we don't have to call require("mason-lspconfig").setup()
      { "mason-org/mason-lspconfig.nvim", opts = {} },
    },
    config = function()
      -- Automatically detect LSP configs from lsp folder
      local ensure_installed = require("core.lsp").lsp_list

      require("mason-tool-installer").setup({
        ensure_installed = vim.tbl_deep_extend("force", ensure_installed, {}),
      })
    end,
  },
  {
    "rshkarin/mason-nvim-lint",
    cond = vim.g.vscode == nil,
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-lint",
    },
    opts = {
      ensure_installed = {},
      automatic_installation = true,
      -- suppress warning as they are not included in Mason registry
      ignore_install = {
        "clj-kondo",
        "janet",
        "ruby",
        "inko",
      },
    },
  },
}
