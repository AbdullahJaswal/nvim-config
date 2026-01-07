-- ~/.config/nvim/lua/config/options.lua
local opt = vim.opt

-- UI
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.updatetime = 250
opt.laststatus = 3
opt.showmode = false

-- Tabs & Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- System
opt.clipboard = "unnamedplus"
opt.undofile = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.timeoutlen = 300

-- Remove padding/margins
opt.fillchars = { eob = " " } -- Hide ~ on empty lines
opt.cmdheight = 1 -- Standard command line row
opt.pumheight = 10
opt.showtabline = 0 -- Hide tabline if not using tabs
