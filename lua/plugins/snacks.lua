-- Snacks window styles: Snacks.terminal ships with no `border` at all, so the
-- float had no FloatBorder to colorize. `border = true` makes it resolve
-- vim.o.winborder (set in config/options.lua) and highlight via FloatBorder.
return {
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        terminal = {
          border = true,
        },
      },
    },
  },
}
