-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Diagnostics: open the float AND move the cursor into it.
-- vim.diagnostic.open_float is synchronous and returns the window id, so the
-- focus is exact -- no polling needed. Press q or <Esc> to close and come back.
local function focus_diagnostic_float(opts)
  local _, winid = vim.diagnostic.open_float(opts)
  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_set_current_win(winid)
  end
end

vim.keymap.set("n", "<leader>cd", function()
  focus_diagnostic_float({ scope = "line" })
end, { desc = "Line Diagnostics" })

-- ]d / [d (and the severity variants) jump with their own float, via
-- vim.diagnostic.jump. That float is separate from <leader>cd, so it needs the
-- same treatment. on_jump replaces the float option, deprecated in 0.14.
local function diagnostic_goto(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      on_jump = function(_, bufnr)
        focus_diagnostic_float({ bufnr = bufnr, scope = "line" })
      end,
    })
  end
end

vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- x deletes into the black hole register, so single-char deletes no longer
-- clobber the unnamed register and p still pastes whatever you last yanked.
-- A count still works: 3x sends 3"_x.
vim.keymap.set("n", "x", '"_x', { desc = "Delete char (no yank)" })
