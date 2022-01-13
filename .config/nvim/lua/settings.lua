local opt = vim.opt

vim.g.mapleader = " "

------------
-- Behavior
------------
-- Automatically reread the file you are editing when it is changed.
opt.autoread = true
-- Enable mouse
opt.mouse = "a"
opt.whichwrap = "b,s,h,l,<,>,[,]"

-- Integrate the clipboard and Neovim's unnamed register
opt.clipboard:append "unnamedplus"

opt.confirm = true
opt.wildmenu = true
opt.hidden = true

opt.undofile = true

-- Distinguish between uppercase and lowercase letters only when they are mixed.
opt.smartcase = true
-- not case sensitive
opt.ignorecase = true
opt.inccommand = "split"

opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd [[autocmd FileType help wincmd L]]

opt.timeoutlen = 400

------------
-- Editing
------------
opt.completeopt = "menuone,noselect"
opt.tabstop = 2
opt.shiftwidth = 0
opt.expandtab = true
-- tab -> space
opt.smarttab = true

------------
-- Appearance
------------
opt.number = true
opt.signcolumn = "number"
opt.cursorline = true

opt.winblend = 15
opt.pumblend = 15
