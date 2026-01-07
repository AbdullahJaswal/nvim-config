-- ~/.config/nvim/lua/config/keymaps.lua
vim.g.mapleader = " "       -- Space is the leader key
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================

-- Space + w → Save the current file
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save File" })

-- Space + x → Close the current buffer (file)
map("n", "<leader>x", "<cmd>bd<cr>", { desc = "Close Buffer" })

-- Space + q → Close the current window (split)
map("n", "<leader>q", "<cmd>close<cr>", { desc = "Close Window" })

-- Space + Q → Quit Neovim entirely
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit All" })

-- ============================================================================
-- WINDOW NAVIGATION
-- ============================================================================

-- Ctrl + h → Move focus to the LEFT window
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })

-- Ctrl + j → Move focus to the BOTTOM window
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })

-- Ctrl + k → Move focus to the TOP window
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })

-- Ctrl + l → Move focus to the RIGHT window
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

-- ============================================================================
-- WINDOW RESIZE
-- ============================================================================

-- Ctrl + Up Arrow → Increase window height
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })

-- Ctrl + Down Arrow → Decrease window height
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })

-- Ctrl + Left Arrow → Decrease window width
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Ctrl + Right Arrow → Increase window width
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- ============================================================================
-- UTILITY
-- ============================================================================

-- Escape → Clear search highlights (removes yellow highlighting after search)
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlights" })

-- Space + l → Open Lazy plugin manager
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy Plugin Manager" })

-- ============================================================================
-- LINE MOVEMENT (Visual Mode)
-- ============================================================================

-- J (in visual mode) → Move selected lines DOWN
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })

-- K (in visual mode) → Move selected lines UP
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

-- ============================================================================
-- BETTER DEFAULTS
-- ============================================================================

-- J → Join lines but keep cursor in place
map("n", "J", "mzJ`z", { desc = "Join Lines (keep cursor)" })

-- Ctrl + d → Half page down, then center screen
map("n", "<C-d>", "<C-d>zz", { desc = "Half Page Down (centered)" })

-- Ctrl + u → Half page up, then center screen
map("n", "<C-u>", "<C-u>zz", { desc = "Half Page Up (centered)" })

-- n → Next search result, centered on screen
map("n", "n", "nzzzv", { desc = "Next Search Result (centered)" })

-- N → Previous search result, centered on screen
map("n", "N", "Nzzzv", { desc = "Prev Search Result (centered)" })

-- ============================================================================
-- DIAGNOSTICS (Errors/Warnings)
-- ============================================================================

-- [ + d → Go to previous error/warning
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to Previous Diagnostic" })

-- ] + d → Go to next error/warning
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to Next Diagnostic" })

-- Space + d → Show error/warning details in floating window
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostic" })

-- ============================================================================
-- OPTION + ARROW KEYS (Fast scrolling - 3 lines at a time)
-- ============================================================================

-- Option + Up Arrow → Move cursor UP 3 lines
map({ "n", "v" }, "<M-Up>", "3k", { desc = "Move Up 3 Lines" })

-- Option + Down Arrow → Move cursor DOWN 3 lines
map({ "n", "v" }, "<M-Down>", "3j", { desc = "Move Down 3 Lines" })

-- Option + Up Arrow (in insert mode) → Move cursor UP 3 lines
map("i", "<M-Up>", "<C-o>3k", { desc = "Move Up 3 Lines" })

-- Option + Down Arrow (in insert mode) → Move cursor DOWN 3 lines
map("i", "<M-Down>", "<C-o>3j", { desc = "Move Down 3 Lines" })
