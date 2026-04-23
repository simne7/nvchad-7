local M = {}

--- Move the current buffer into a window selected via window-picker.
--- @param stay boolean If true, keep focus in the current window instead of following the buffer.
function M.move_to_picked_window(stay)
  local buf = vim.api.nvim_get_current_buf()
  local src_win = vim.api.nvim_get_current_win()

  local ok, picker = pcall(require, "window-picker")
  if not ok then
    vim.notify("window-picker is not installed", vim.log.levels.ERROR)
    return
  end

  local target_win = picker.pick_window()

  if not target_win then
    return
  end

  if target_win == src_win then
    vim.notify("Already in the selected window", vim.log.levels.WARN)
    return
  end

  vim.api.nvim_win_set_buf(target_win, buf)

  local alt_buf = vim.fn.bufnr "#"
  if alt_buf == -1 or alt_buf == buf or not vim.api.nvim_buf_is_valid(alt_buf) then
    alt_buf = vim.api.nvim_create_buf(false, true)
  end
  vim.api.nvim_win_set_buf(src_win, alt_buf)

  if not stay then
    vim.api.nvim_set_current_win(target_win)
  end
end

return M
