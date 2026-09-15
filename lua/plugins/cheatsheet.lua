-- Read-only cheatsheet float, toggled with <leader>ch.
--
-- The source is cheatsheet.tex (a Cheatography LaTeX export). LaTeX can't be
-- rendered in a buffer, so it was converted once to cheatsheet.md; that's the
-- file shown here.
local path = vim.fn.stdpath("config") .. "/cheatsheet.md"

local win ---@type snacks.win?

local function toggle()
  if win and win:valid() then
    win:close()
    win = nil
    return
  end

  if vim.fn.filereadable(path) == 0 then
    vim.notify("Cheatsheet not found: " .. path, vim.log.levels.WARN)
    return
  end

  win = Snacks.win({
    text = function()
      return vim.fn.readfile(path)
    end,
    ft = "markdown",
    title = " Cheatsheet ",
    title_pos = "center",
    border = "rounded",
    enter = true,
    width = 0.7,
    height = 0.8,
    bo = {
      modifiable = false,
      readonly = true,
    },
    wo = {
      wrap = false,
      number = false,
      relativenumber = false,
      signcolumn = "no",
      cursorline = true,
      conceallevel = 2,
    },
    keys = {
      q = "close",
      ["<esc>"] = "close",
    },
    on_close = function()
      win = nil
    end,
  })
end

return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>ch", toggle, desc = "Cheatsheet" },
    },
  },
}
