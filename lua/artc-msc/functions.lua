-- ============================================================================
--  _   _  _____  ___
-- | \ | ||  ___|/ _ \
-- |  \| || |_  | (_) |
-- | |\  ||  _|  \__, |
-- |_| \_||_|      /_/
--
-- functions.lua file for NoiseFrk900
-- ============================================================================

local o = vim.o

-- FUNCTIONS
----FOLD TOGGLE
function FoldColumnToggle()
	if o.foldcolumn=="3" then
		o.foldcolumn="0"
	else
		o.foldcolumn="2"
	end
end

----STATUSLINE TOGGLE
function StatuslineToggle()
	if o.laststatus==2 then
		o.laststatus=0
	else
		o.laststatus=2
	end
end

----COLORCOLUMN TOGGLE
function TextWdToggle()
	if o.colorcolumn=="0" then
		o.textwidth=80
		o.colorcolumn="81"
	else
		o.textwidth=0
		o.colorcolumn="0"
	end
end

----LISTCHAR TOGGLE
function ListcharToggle()
	if o.list == true then
		o.list = false
	else
		o.list = true
	end
end

----WORD COUNT
local wordString
function GetLiveWords()
        if vim.fn.wordcount().visual_words then
                wordString = tostring(vim.fn.wordcount().visual_words)
        else
                wordString = tostring(vim.fn.wordcount().cursor_words)
        end
        return wordString
end

function GetWords()
        return tostring(vim.fn.wordcount().words)
end

function Window()
	return vim.api.nvim_win_get_number(0)
end

----FOLD FUNCTION
local persistFold = vim.api.nvim_create_augroup("RememberFolds", {clear = true})
vim.api.nvim_create_autocmd(
  {"BufWinLeave", "BufLeave"},
  { pattern = {"*.zt", "*.lua", "*.md", "*.c", "*.py", ".*rc", "*.config",
	"*.conf", "*.jsonc", "*.html", "*.css", "*.fish"},
  command = "silent! mkview",
  group = persistFold,
  }
)
vim.api.nvim_create_autocmd(
  {"BufWinEnter", "BufEnter"},
  { pattern = {"*.zt", "*.lua", "*.md", "*.c", "*.py", ".*rc", "*.config",
	"*.conf", "*.jsonc", "*.html", "*.css", "*.fish"},
  command = "silent! loadview",
  group = persistFold,
  }
)

--UNUSED FUNCTIONS
----QUICKFIX TOGGLE
--[[let g:quickfix_is_open = 0
function! QuickfixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_return_to_window . "wincmd w"
	else
		let g:quickfix_returne_to_window = winnr()
		copen
		let g:quickfix_is_open = 1
	endif
endfunction

----COLORGEN
function! ColorGen()
		:normal 127Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 128Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 129Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 130Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 131Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 132Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 133Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 134Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 137Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 138Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 139Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 140Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 141Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 142Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 143Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 144Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 145Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
		:normal 146Gww"ayiwww"byiw
		execute "27,123s/".@a."/".@b."/g"
endfunction --]]

