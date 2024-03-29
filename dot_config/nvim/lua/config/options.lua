-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.vscode then
  -- VSCode extension
else
  -- enable relative line numbers
  vim.opt.relativenumber = true
  -- undo directory
  vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
  -- highlight the current line
  vim.opt.cursorline = true
  -- highlight the current column
  vim.opt.cursorcolumn = true
end
