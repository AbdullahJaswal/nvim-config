-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- Moving two lines up with Ctrl+Up
keymap.set('n', '<A-Up>', '2k', { noremap = true, silent = true })

-- Moving two lines down with Ctrl+Down
keymap.set('n', '<A-Down>', '2j', { noremap = true, silent = true })
