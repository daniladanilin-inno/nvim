-- noice renders LSP hover as a nui popup that is mounted with enter = false and
-- exposes no way to focus it, so `K` could never be jumped into. Handing hover
-- back to the builtin gives a real, focusable float -- bordered by
-- vim.o.winborder (config/options.lua) and colored by FloatBorder.
return {
  {
    "folke/noice.nvim",
    opts = {
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false },
      },
    },
  },
}
