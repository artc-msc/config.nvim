-- ============================================================================
--  _   _  _____  ___
-- | \ | ||  ___|/ _ \
-- |  \| || |_  | (_) |
-- | |\  ||  _|  \__, |
-- |_| \_||_|      /_/
--
-- options.lua file for NoiseFrk900
-- ============================================================================
--
-- See `:help vim.opt`
--  For more options, you can see `:help option-list`

-- MACROS  
local o = vim.o

-- COLORS
vim.cmd([[syntax enable]])
vim.cmd([[colorscheme library]])
o.termguicolors = true
--o.background = dark

-- LINE NUMBERS
-- *Enable relative line numbers
o.number = true
o.relativenumber = true

-- TABS
-- Set tab to 4 spaces
o.tabstop = 4
-- o.softtabstop = 4
-- o.et = true

-- INDENTING
-- *Enable auto indenting nd set it to spaces
-- o.cindent = true
-- o.shiftwidth = 4
--
-- *Enable break indent
o.breakindent = true

-- SEARCHING
-- *Enable incremental searching
o.incsearch = true
o.hlsearch = true

-- *Case-insensitive searching UNLESS \C or capital in search
o.ignorecase = false
o.smartcase = false

-- FOLDS
-- *Show folds
o.foldcolumn = '3'

-- COLUMNS
-- *Keep text limited to 80 columns
o.colorcolumn = '81'
o.wrap = true
o.tw = 80

-- WORKING DIRECTORY
o.autochdir = true

-- MOUSE
-- *Enable mouse mode
o.mouse = 'a'

-- CLIPBOARD
-- *Sync clipboard between OS and Neovim.
-- * Remove this option if you want your OS clipboard to remain independent.
-- * See `:help 'clipboard'`
o.clipboard = 'unnamedplus'

-- HISTORY
-- *Save undo history
o.undofile = true

-- SIGNCOLUMN
vim.wo.signcolumn = 'no'

-- UPDATE TIME
-- Decrease update time
o.updatetime = 250
o.timeoutlen = 300

-- COMPLETIONS
-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect,noinsert'

-- NERD FONT
-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- SHOW MODE
-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- SPLITS
vim.opt.splitright = true
vim.opt.splitbelow = true

-- WHITESPACE
-- *Sets how neovim will display certain whitespace in the editor.
-- * See `:help 'list'`
--
-- * and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- SUBSTITUTIONS
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- CURSOR
-- *Show which line your cursor is on
vim.opt.cursorline = true

-- *Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
