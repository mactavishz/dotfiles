-- More about how to set up lsps in neovim >= 0.11
-- See: https://gpanders.com/blog/whats-new-in-neovim-0-11/
-- Automatically detect and enable LSPs from lsp folder
local M = {}

M.lsp_list = {
  "lua_ls",
  "gopls",
  "clangd",
  "rust_analyzer",
  "ts_ls",
  "bashls",
  "pyright",
  "ruff",
  "ruby_lsp",
  "rust_analyzer",
  "texlab",
  "yamlls",
  "helm_ls",
  "jsonls",
  "marksman",
  "ansiblels",
  "astro",
}

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
  severity_sort = true,
  float = { border = "rounded", source = "if_many" },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  } or {},
  -- virtual_text = {
  --   source = 'if_many',
  --   spacing = 2,
  --   format = function(diagnostic)
  --     local diagnostic_message = {
  --       [vim.diagnostic.severity.ERROR] = diagnostic.message,
  --       [vim.diagnostic.severity.WARN] = diagnostic.message,
  --       [vim.diagnostic.severity.INFO] = diagnostic.message,
  --       [vim.diagnostic.severity.HINT] = diagnostic.message,
  --     }
  --     return diagnostic_message[diagnostic.severity]
  --   end,
  -- },
})

return M
