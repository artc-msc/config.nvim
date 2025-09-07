local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<leader>h", "i#!/usr/bin/python3.8<CR>", opts)
