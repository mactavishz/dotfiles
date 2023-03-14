vim.opt.termguicolors = true

vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true                   -- set relative numbered lines

vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file

vim.opt.hlsearch = false                        -- highlight all matches on previous search pattern
vim.opt.incsearch = true                        -- increamental search
vim.opt.ignorecase = false                      -- ignore case in search patterns

vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore

vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window

vim.opt.backup = false                          -- creates a backup file
vim.opt.swapfile = false
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.softtabstop = 4

vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.wrap = false                            -- display lines as one long line

vim.opt.cursorline = true                       -- highlight the current line
vim.opt.cursorcolumn = true                     -- highlight the current column

vim.opt.signcolumn = "yes"                      -- always show the sign column otherwise it would shift the text each time
vim.opt.scrolloff = 8                           -- is one of my fav
-- vim.opt.colorcolumn = "80"
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

vim.opt.updatetime = 50                         -- quick and responsive update
vim.opt.timeoutlen = 500
