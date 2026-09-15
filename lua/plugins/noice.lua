-- noice overrides LSP hover/signature help, and its `hover` view hardcodes
-- border.style = "none" -- so vim.o.winborder never reaches it. This preset
-- switches the view to a rounded border, drawn with NoicePopupBorder, which
-- links to FloatBorder (magenta in the pulsar theme).
return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
    },
  },
}
