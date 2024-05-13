-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- Moving three lines up with Ctrl+Up
keymap.set('n', '<A-Up>', '3k', { noremap = true, silent = true })

-- Moving three lines down with Ctrl+Down
keymap.set('n', '<A-Down>', '3j', { noremap = true, silent = true })
