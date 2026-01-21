local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local preview = require("float-preview")

--FUNCTION KEYS
--map("n", "<F1>", "RESERVED FOR HELP", opts)
map("n", "<F2>", ":lua FoldColumnToggle()<CR>", opts)
map("n", "<F3>", ":set number! relativenumber!<CR>", opts)
map("n", "<F4>", ":lua StatuslineToggle()<CR>", opts)
map("n", "<F5>", ":set spell!<CR>", opts)
map("n", "<F6>", ":lua TextWdToggle()<CR>", opts)
map("n", "<F7>", ":lua ListcharToggle()<CR>", opts)
map("n", "<F8>", ":IBLToggle<CR>", opts)
map("n", "<F9>", ":set scrollbind!<CR>", opts)
map("n", "<F10>", ":execute terminal<CR>j", opts)
map("n", "<F12>", "<Nop>", opts)

map("n", "<leader>b", ":split /home/noisefrk900/.bashrc<CR>", opts)
map("n", "<leader>x", "**", opts)
map("n", "<leader>*", ":noh<CR>", opts)
map({"n","i", "v"}, "<leader>;", "<ESC>", opts)

map("n", "<leader>/", "/\v", opts)
map("n", "<leader>o", "o<esc>", opts)
map("n", "<leader>O", "O<esc>", opts)

map("n", "<leader>t", ":colo library<CR>", opts)
map("n", "<leader>ww", ":call ColorGen()<CR>", opts)
map("n", "<leader>d", ":Inspect<CR>", opts)

--MISC MAPPINGS
map("i", "<C-f>", "<C-x><C-o>", opts)
map("n", "<C-f>", "i<C-x><C-o>", opts)
map("n", "<space>", "za", opts)
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
-- Keymaps for better default experience
-- See `:help map()`

map("n", "<leader>f", preview.toggle_preview, { desc = "Toggle file preview" })

-- Remap for dealing with word wrap
-- map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


--local ft = pfiletype.detect(filepath)
--map('n', 'j', "&ft == 'netrw' ? 'j<cr>' : 'j'", opts )
--
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local treeutils = require("treeutils")

map('n', '<c-f>', treeutils.launch_find_files, opts)
map('n', '<c-g>', treeutils.launch_live_grep,  opts)

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
