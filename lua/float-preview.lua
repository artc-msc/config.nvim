-- lua/file_preview.lua
local M = {}

local preview_win = nil
local preview_buf = nil
local augroup = vim.api.nvim_create_augroup("FilePreviewAuto", { clear = true })
local last_file = nil

local function get_filename_under_cursor()
  local word = vim.fn.expand("<cfile>")
  if word ~= "" and vim.fn.filereadable(word) == 1 then
    return vim.fn.fnamemodify(word, ":p") -- return absolute path
  end
  return nil
end

local function create_floating_window()
  local width = math.floor(vim.o.columns * 0.6)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true) -- listed=false, scratch=true

 -- explicit rounded borders (compatible with all versions)
--  local rounded_border = {
 --   "╭", "─", "╮",
  --  "│",
   -- "╯",
 --   "─",
  --  "╰",
   -- "│",
--  }

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "editor",
    width = 80,
    height = 23,
    row = row,
    col = col,
    border = "rounded",
    style = "minimal",
  })

  return win, buf
end

local function detect_filetype_from_name(filename)
  -- Prefer Neovim's filetype matcher if available
  local ft = nil
  if vim.filetype and vim.filetype.match then
    pcall(function()
      ft = vim.filetype.match({ filename = filename })
    end)
  end
  -- Fallback to extension if match didn't find anything
  if not ft or ft == "" then
    local ext = vim.fn.fnamemodify(filename, ":e")
    ft = ext
  end
  return ft
end

local function load_preview(file)
  if not file or vim.fn.filereadable(file) ~= 1 then
    return
  end

  -- Create preview window/buffer if needed
  if not preview_win or not vim.api.nvim_win_is_valid(preview_win) then
    preview_win, preview_buf = create_floating_window()
  end

  -- Give the buffer a name (helps filetype detection / modelines)
  vim.api.nvim_buf_set_name(preview_buf, file)

  -- Read file contents and populate buffer
  local content = vim.fn.readfile(file)
  vim.api.nvim_buf_set_option(preview_buf, "modifiable", true)
  vim.api.nvim_buf_set_lines(preview_buf, 0, -1, false, content)

  -- Buffer options
  vim.bo[preview_buf].modifiable = false
  vim.bo[preview_buf].readonly = true
  vim.bo[preview_buf].buftype = "nofile"
  vim.bo[preview_buf].swapfile = false
  vim.bo[preview_buf].bufhidden = "wipe"

  -- Ensure syntax system is enabled (harmless if already on)
  vim.cmd("syntax enable")

  -- Detect filetype and set it on the preview buffer so syntax highlighting applies
  local ft = detect_filetype_from_name(file)
  if ft and ft ~= "" then
    -- use nvim API to set filetype for that buffer
    pcall(function()
      vim.api.nvim_buf_set_option(preview_buf, "filetype", ft)
    end)
    -- Trigger FileType autocommands for the preview buffer so plugins/syntax activate
    pcall(function()
      vim.api.nvim_command(("doautocmd <buffer=%d> FileType"):format(preview_buf))
    end)
  end

  -- Trigger syntax loading (including after/syntax)
  pcall(function()
    vim.api.nvim_buf_call(preview_buf, function()
      vim.cmd("syntax on")
      vim.cmd("runtime! syntax/zettel.vim")
      vim.cmd("runtime! after/syntax/zettel.vim")
   end)
  end)
    
end

-- Auto-update handler: reload preview when file under cursor changes
local function update_preview()
  if not preview_win or not vim.api.nvim_win_is_valid(preview_win) then
    return
  end

  local new_file = get_filename_under_cursor()

  -- If there's no file under cursor, don't change preview (optional: you could close it)
  if not new_file then
    return
  end

  if new_file ~= last_file then
    last_file = new_file
    load_preview(new_file)
  end
end

function M.toggle_preview()
  if preview_win and vim.api.nvim_win_is_valid(preview_win) then
    vim.api.nvim_win_close(preview_win, true)
    preview_win = nil
    preview_buf = nil
    last_file = nil
    vim.api.nvim_clear_autocmds({ group = augroup })
    return
  end

  local file = get_filename_under_cursor()
  if not file then
    vim.notify("No valid file under cursor", vim.log.levels.WARN)
    return
  end

  last_file = file
  load_preview(file)

  -- Auto-update on cursor move / scroll in the original window
  vim.api.nvim_clear_autocmds({ group = augroup })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinScrolled" }, {
    group = augroup,
    callback = update_preview,
  })
end

return M

