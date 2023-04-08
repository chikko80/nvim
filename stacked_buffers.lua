-- stack_buffer_management.lua

local function get_list_index(list, target)
  local index = nil

  for i, v in ipairs(list) do
    if v == target then
      index = i
      break
    end
  end
  return index
end

local function get_open_buffers()
  local bufs = vim.t.bufs or nil

  if not bufs then
    return {}
  end

  for i = #bufs, 1, -1 do
    if not vim.api.nvim_buf_is_valid(bufs[i]) and vim.bo[bufs[i]].buflisted then
      table.remove(bufs, i)
    end
  end
  return bufs
end

local function move_buffer_to_pane(direction)
  local current_window = vim.api.nvim_get_current_win()
  local current_tab = vim.api.nvim_get_current_tabpage()

  -- create list

  local valid_winid = {}

  local windows = vim.api.nvim_tabpage_list_wins(current_tab)
  for _, win_id in ipairs(windows) do
    local buffer_number = vim.api.nvim_win_get_buf(win_id)
    -- extract file_name
    local bufname = vim.api.nvim_buf_get_name(buffer_number):match "([^/]+)$"
    -- if not empty and not NvimTree
    if bufname ~= nil and not bufname:match "^NvimTree" then
      table.insert(valid_winid, win_id)
    end
  end

  local index = get_list_index(valid_winid, current_window)

  local new_win_id

  if direction == "right" then
    new_win_id = valid_winid[index + 1]
  elseif direction == "left" then
    new_win_id = valid_winid[index - 1]
  end

  -- Get a list of all windows in the current tabpage
  local windows = vim.api.nvim_tabpage_list_wins(0)

  -- Iterate over each window and print its buffer name
  for _, win in ipairs(windows) do
    local bufnr = vim.api.nvim_win_get_buf(win)
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    print("Window " .. win .. ": " .. bufname)
  end

  -- if new_win_id == nil then
  --   return
  -- end
  --
  -- local old_buf = vim.api.nvim_get_current_buf()
  -- local old_win_id = vim.api.nvim_get_current_win()
  -- local old_cursor_position = vim.api.nvim_win_get_cursor(old_win_id)
  --
  -- -- move buffer and set cursor position
  -- vim.api.nvim_win_set_buf(new_win_id, old_buf)
  -- vim.api.nvim_set_current_win(new_win_id)
  -- vim.api.nvim_win_set_cursor(new_win_id, old_cursor_position)
  -- -- center
  -- vim.cmd "normal! zz"
  --
  -- local bufs = get_open_buffers()
  --
  -- vim.api.nvim_win_set_buf(old_win_id, bufs[1])

  -- -- Get the current window ID, buffer, and cursor position
  -- local current_buffer = vim.api.nvim_get_current_buf()
  -- local current_win_id = vim.api.nvim_get_current_win()
  -- local current_cursor_position = vim.api.nvim_win_get_cursor(current_win_id)
  -- print(vim.inspect(current_cursor_position))
  --
  -- -- Set the target window ID
  -- local target_win_id = target_win
  -- -- Set the buffer and cursor position in the target window
  -- print(current_win_id)
  -- print(target_win_id)

  -- get current win_id

  -- get index of current win_id in list
  --
end

return {
  move_buffer_to_pane = move_buffer_to_pane,
}

-- :windo echo 'Window ID:' . win_getid() . ', Buffer number:' . bufnr('')
-- :windo echo 'Window ID:' . win_getid() . ', File name:' . bufname('')
