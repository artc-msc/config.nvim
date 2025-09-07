local opts = { noremap = true, silent = true }
--local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

--FUNCTION KEYS
map("n", "<F2>", ":lua FoldColumnToggle()<CR>", opts)
map("n", "<F3>", ":set number! relativenumber!<CR>", opts)
map("n", "<F4>", ":lua StatuslineToggle()<CR>", opts)
map("n", "<F5>", ":set spell!<CR>", opts)
map("n", "<F6>", ":lua TextWdToggle()<CR>", opts)
map("n", "<F7>", ":lua ListcharToggle()<CR>", opts)
map("n", "<F8>", ":IBLToggle<CR>", opts)
map("n", "<F9>", ":set scrollbind!<CR>", opts)
map("n", "<F10>", ":execute terminal<CR>j", opts)
map("n", "<F12>", ":set omnifunc=ztcomplete#CompleteHT", opts)

--keymap("n", "<leader>v", ":split $MYVIMRC<CR>", opts)
--map("n", "<leader>s", "lua vim.cmd.source $MYVIMRC<CR>", opts)
--map("n", "<leader>c", ":split /home/noisefrk900/.vim/colors/library.vim<CR>", opts)
map("n", "<leader>b", ":split /home/noisefrk900/.bashrc<CR>", opts)
map("n", "<leader>f", ":split /home/noisefrk900/.config/fish/config.fish<CR>", opts)
--keymap("n", "<leader>#", ":execute leftabove sp ".bufname("#")<CR>", opts)
map("n", "<leader>x", "**", opts)
map("n", "<leader>*", ":noh<CR>", opts)
map({"n","i", "v"}, "<c-[>", "<ESC>", opts)
map({"n","i", "v"}, "<leader>;", "<ESC>", opts)

--window navigation
map("n", "<localleader>h", "<C-w>h", opts)
map("n", "<localleader>j", "<C-w>j", opts)
map("n", "<localleader>k", "<C-w>k", opts)
map("n", "<localleader>l", "<C-w>l", opts)
--map("n", "<localleader>s", ":w<CR><ESC>", opts)
--map("n", "<localleader>q", ":q<CR><ESC>", opts)
--map("n", "<localleader>d", ":bd<CR><ESC>", opts)
map("i", "<localleader>`", "<ESC>", opts)

--keymap("n", "j", "j", opts)
--keymap("n", "k", "k" ,opts)

map("n", "<leader>/", "/\v", opts)
map("n", "<leader>o", "o<esc>", opts)
map("n", "<leader>O", "O<esc>", opts)
-- I used this binding for ESC
--map("n", "<leader>z", ":cnext<CR>", opts)
--map("n", "<leader>a", ":cprevious<CR>", opts)
--dup to diagnotic mapping
--keymap("n", "<leader>q", ":call QuickfixToggle()<CR>", opts)
map("n", "<leader>N", ":lua TreeToggle()<CR>", opts)
map("n", "<leader>n", ":lua vim.cmd('NERDTreeToggle')<CR>",opts)
--keymap("n", "<leader>n", ":NERDTree<CR><C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><<C-w><", opts)

map("n", "<leader>t", ":colo library<CR>", opts)
map("n", "<leader>ww", ":call ColorGen()<CR>", opts)
map("n", "<leader>d", ":Inspect<CR>", opts)


--keymap("n", "<localleader>s", "iNoiseFrk900 <NoiseFreak900@gmail.com>", opts)
--keymap("n", "<localleader>g", "ihttps://github.com/noisefrk900/REPO.git", opts)
--keymap("i", "<localleader>b", "{", opts)
--keymap("i", "<localleader>v", "}", opts)
--keymap("i", "<localleader><S-b>", "[", opts)
--keymap("i", "<localleader><S-v>", "]", opts)
--keymap("n", "<localleader>q", "jBi<CR>.<space><esc>0", opts)
--keymap("n", "<localleader>e", "ggfEdiWx", opts)
--keymap("n", "<localleader>w", ":w<CR><esc>", opts)
--keymap("n", "<localleader>z", "<C-w><", opts)
--keymap("n", "<localleader>a", "<C-w>>", opts)


--MISC MAPPINGS
map("i", "<C-f>", "<C-x><C-o>", opts)
map("n", "<C-f>", "i<C-x><C-o>", opts)
map("n", "<space>", "za", opts)
--map({'n', 'v', 'i'}, "<tab>", "<C-v><tab>", opts)
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
--keymap("n", ; :", opts)
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
--vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


--local ft = pfiletype.detect(filepath)
--vim.keymap.set('n', 'j', "&ft == 'netrw' ? 'j<cr>' : 'j'", opts )
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

vim.keymap.set('n', '<c-f>', treeutils.launch_find_files, opts)
vim.keymap.set('n', '<c-g>', treeutils.launch_live_grep,  opts)

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
