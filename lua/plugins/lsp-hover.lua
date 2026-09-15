-- Auto-focus the hover float on a single K.
--
-- vim.lsp.buf.hover() is async: the window only exists once the server replies,
-- and the builtin records it in b:lsp_floating_preview (see runtime
-- lua/vim/lsp/util.lua). So we poll briefly for it rather than guessing a delay.
local function focus_hover(tries)
  tries = tries or 12
  local winid = vim.b.lsp_floating_preview
  if winid and vim.api.nvim_win_is_valid(winid) then
    vim.api.nvim_set_current_win(winid)
    return
  end
  if tries > 0 then
    vim.defer_fn(function()
      focus_hover(tries - 1)
    end, 25)
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- "*" applies to every client. LazyVim declares
        -- opts_extend = { "servers.*.keys" }, so this appends to the default
        -- keymaps, and the later K wins over LazyVim's.
        ["*"] = {
          keys = {
            {
              "K",
              function()
                vim.lsp.buf.hover()
                focus_hover()
              end,
              desc = "Hover (focus)",
            },
          },
        },
      },
    },
  },
}
