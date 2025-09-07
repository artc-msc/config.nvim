-- ============================================================================
--  _   _  _____  ___
--  | \ | ||  ___|/ _ \
--  |  \| || |_  | (_) |
--  | |\  ||  _|  \__, |
--  |_| \_||_|      /_/
-- 
--  .init.lua file for NoiseFrk900
--  ============================================================================
--
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ","
vim.g.maplocalleader = ";"

require("lazy-bootstrap")
require("lazy-plugins")
require("nightfox-setup")
require("artc-msc.options")
require("artc-msc.remaps")
require("artc-msc.functions")
require("lualine-setup")
require("telescope-setup")
require("treesitter-setup")
require("lsp-setup")
require("cmp-setup")
require("nvim-tree-setup")
require("nvim-tree-preview-setup")
--
--local vim = vim
-- local Plug = vim.fn['plug#']

-- vim.call('plug#begin')
-- Plug('scrooloose/nerdtree')
-- Plug('numEricL/nerdtree-live-preview')
-- vim.call('plug#end')
