-- Pulsar Theme for Neovim
-- Cosmic-inspired palette: electric blues, luminous magentas, radiant cyans
-- against the deep void of space. Palette matches ghostty.conf.

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local c = {
          -- Backgrounds (darkest -> lightest)
          bg0 = "#0a0314",
          bg1 = "#140822",
          bg2 = "#1f0f33",
          bg3 = "#2b1547",
          bg4 = "#3a1c5e",

          -- Foregrounds
          fg = "#e0e6ff",
          fg_dim = "#aa5abc",
          muted = "#5a5070",

          -- Accents (pulsar core)
          blue = "#3298fa",
          blue_br = "#50b0ff",
          magenta = "#b82aff",
          magenta_br = "#d25dff",
          cyan = "#3df2f2",
          cyan_br = "#59ffff",

          -- Supporting accents
          red = "#ff0a3c",
          red_br = "#ff3860",
          green = "#5cb960",
          green_br = "#70d674",
          yellow = "#f2e42e",
          yellow_br = "#ffff4d",
          white = "#ffffff",
        }
        ---@diagnostic disable: undefined-global
        vim.cmd("highlight clear")
        if vim.fn.exists("syntax_on") then
          vim.cmd("syntax reset")
        end

        vim.o.termguicolors = true
        vim.o.background = "dark"
        vim.g.colors_name = "pulsar"

        local hl = vim.api.nvim_set_hl

        -- Editor
        hl(0, "Normal", { fg = c.fg, bg = c.bg0 })
        hl(0, "NormalFloat", { fg = c.fg, bg = c.bg1 })
        hl(0, "FloatBorder", { fg = c.magenta, bg = c.bg1 })
        hl(0, "FloatTitle", { fg = c.cyan, bg = c.bg1, bold = true })
        hl(0, "Cursor", { fg = c.bg0, bg = c.magenta })
        hl(0, "CursorLine", { bg = c.bg2 })
        hl(0, "CursorLineNr", { fg = c.cyan, bold = true })
        hl(0, "LineNr", { fg = c.muted })
        hl(0, "Visual", { bg = c.bg3 })
        hl(0, "VisualNOS", { bg = c.bg3 })
        hl(0, "Search", { fg = c.bg0, bg = c.blue })
        hl(0, "IncSearch", { fg = c.bg0, bg = c.magenta_br })
        hl(0, "MatchParen", { fg = c.cyan_br, bold = true })
        hl(0, "NonText", { fg = c.muted })
        hl(0, "EndOfBuffer", { fg = c.bg1 })
        hl(0, "Whitespace", { fg = c.bg3 })

        -- Syntax
        hl(0, "Comment", { fg = c.fg_dim, italic = true })
        hl(0, "Constant", { fg = c.magenta_br })
        hl(0, "String", { fg = c.green })
        hl(0, "Character", { fg = c.green })
        hl(0, "Number", { fg = c.magenta_br })
        hl(0, "Boolean", { fg = c.magenta_br })
        hl(0, "Float", { fg = c.magenta_br })
        hl(0, "Identifier", { fg = c.fg })
        hl(0, "Function", { fg = c.cyan })
        hl(0, "Statement", { fg = c.magenta })
        hl(0, "Conditional", { fg = c.magenta })
        hl(0, "Repeat", { fg = c.magenta })
        hl(0, "Label", { fg = c.magenta_br })
        hl(0, "Operator", { fg = c.blue_br })
        hl(0, "Keyword", { fg = c.magenta })
        hl(0, "Exception", { fg = c.red_br })
        hl(0, "PreProc", { fg = c.magenta_br })
        hl(0, "Include", { fg = c.magenta_br })
        hl(0, "Define", { fg = c.magenta_br })
        hl(0, "Macro", { fg = c.magenta_br })
        hl(0, "PreCondit", { fg = c.magenta_br })
        hl(0, "Type", { fg = c.yellow_br })
        hl(0, "StorageClass", { fg = c.yellow_br })
        hl(0, "Structure", { fg = c.yellow_br })
        hl(0, "Typedef", { fg = c.yellow_br })
        hl(0, "Special", { fg = c.cyan_br })
        hl(0, "SpecialChar", { fg = c.cyan_br })
        hl(0, "Tag", { fg = c.magenta })
        hl(0, "Delimiter", { fg = c.blue_br })
        hl(0, "SpecialComment", { fg = c.fg_dim, italic = true, bold = true })
        hl(0, "Debug", { fg = c.red_br })
        hl(0, "Underlined", { underline = true })
        hl(0, "Error", { fg = c.red_br, bold = true })
        hl(0, "Todo", { fg = c.cyan, bold = true })

        -- UI
        hl(0, "StatusLine", { fg = c.fg, bg = c.bg3 })
        hl(0, "StatusLineNC", { fg = c.muted, bg = c.bg1 })
        hl(0, "TabLine", { fg = c.muted, bg = c.bg2 })
        hl(0, "TabLineFill", { bg = c.bg1 })
        hl(0, "TabLineSel", { fg = c.cyan, bg = c.bg0, bold = true })
        hl(0, "Pmenu", { fg = c.fg, bg = c.bg1 })
        hl(0, "PmenuSel", { fg = c.bg0, bg = c.cyan, bold = true })
        hl(0, "PmenuSbar", { bg = c.bg2 })
        hl(0, "PmenuThumb", { bg = c.magenta })
        hl(0, "WildMenu", { fg = c.bg0, bg = c.magenta_br })
        hl(0, "VertSplit", { fg = c.magenta })
        hl(0, "WinSeparator", { fg = c.magenta })
        hl(0, "Folded", { fg = c.fg_dim, bg = c.bg1 })
        hl(0, "FoldColumn", { fg = c.magenta, bg = c.bg0 })
        hl(0, "SignColumn", { fg = c.magenta, bg = c.bg0 })
        hl(0, "ColorColumn", { bg = c.bg2 })

        -- Diff
        hl(0, "DiffAdd", { fg = c.green, bg = "#0f1a14" })
        hl(0, "DiffChange", { fg = c.blue_br, bg = "#0f1422" })
        hl(0, "DiffDelete", { fg = c.red_br, bg = "#1a0a12" })
        hl(0, "DiffText", { fg = c.cyan_br, bg = c.bg3, bold = true })

        -- Git signs
        hl(0, "GitSignsAdd", { fg = c.green })
        hl(0, "GitSignsChange", { fg = c.blue_br })
        hl(0, "GitSignsDelete", { fg = c.red_br })

        -- Diagnostics
        hl(0, "DiagnosticError", { fg = c.red_br })
        hl(0, "DiagnosticWarn", { fg = c.yellow_br })
        hl(0, "DiagnosticInfo", { fg = c.blue_br })
        hl(0, "DiagnosticHint", { fg = c.cyan })
        hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = c.red_br })
        hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = c.yellow_br })
        hl(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = c.blue_br })
        hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = c.cyan })

        -- LSP
        hl(0, "LspReferenceText", { bg = c.bg2 })
        hl(0, "LspReferenceRead", { bg = c.bg2 })
        hl(0, "LspReferenceWrite", { bg = c.bg2, underline = true })

        -- Treesitter
        hl(0, "@variable", { fg = c.fg })
        hl(0, "@variable.builtin", { fg = c.magenta_br })
        hl(0, "@variable.parameter", { fg = c.yellow_br })
        hl(0, "@variable.member", { fg = c.blue_br })
        hl(0, "@constant", { fg = c.magenta_br })
        hl(0, "@constant.builtin", { fg = c.magenta_br })
        hl(0, "@constant.macro", { fg = c.cyan_br })
        hl(0, "@module", { fg = c.yellow_br })
        hl(0, "@module.builtin", { fg = c.yellow_br })
        hl(0, "@label", { fg = c.magenta_br })
        hl(0, "@string", { fg = c.green })
        hl(0, "@string.escape", { fg = c.cyan_br })
        hl(0, "@string.special", { fg = c.cyan_br })
        hl(0, "@string.regexp", { fg = c.green_br })
        hl(0, "@character", { fg = c.green })
        hl(0, "@character.special", { fg = c.cyan_br })
        hl(0, "@boolean", { fg = c.magenta_br })
        hl(0, "@number", { fg = c.magenta_br })
        hl(0, "@number.float", { fg = c.magenta_br })
        hl(0, "@type", { fg = c.yellow_br })
        hl(0, "@type.builtin", { fg = c.yellow_br })
        hl(0, "@type.definition", { fg = c.yellow_br })
        hl(0, "@attribute", { fg = c.magenta_br })
        hl(0, "@property", { fg = c.blue_br })
        hl(0, "@function", { fg = c.cyan })
        hl(0, "@function.builtin", { fg = c.cyan })
        hl(0, "@function.call", { fg = c.cyan })
        hl(0, "@function.macro", { fg = c.magenta_br })
        hl(0, "@function.method", { fg = c.cyan })
        hl(0, "@function.method.call", { fg = c.cyan })
        hl(0, "@constructor", { fg = c.yellow_br })
        hl(0, "@operator", { fg = c.blue_br })
        hl(0, "@keyword", { fg = c.magenta })
        hl(0, "@keyword.coroutine", { fg = c.magenta })
        hl(0, "@keyword.function", { fg = c.magenta })
        hl(0, "@keyword.operator", { fg = c.magenta })
        hl(0, "@keyword.import", { fg = c.magenta_br })
        hl(0, "@keyword.conditional", { fg = c.magenta })
        hl(0, "@keyword.repeat", { fg = c.magenta })
        hl(0, "@keyword.return", { fg = c.magenta })
        hl(0, "@keyword.exception", { fg = c.red_br })
        hl(0, "@comment", { fg = c.fg_dim, italic = true })
        hl(0, "@comment.documentation", { fg = c.fg_dim, italic = true })
        hl(0, "@punctuation", { fg = c.blue_br })
        hl(0, "@punctuation.bracket", { fg = c.blue_br })
        hl(0, "@punctuation.delimiter", { fg = c.blue_br })
        hl(0, "@punctuation.special", { fg = c.cyan_br })
        hl(0, "@tag", { fg = c.magenta })
        hl(0, "@tag.attribute", { fg = c.yellow_br })
        hl(0, "@tag.delimiter", { fg = c.blue_br })

        -- Telescope
        hl(0, "TelescopeBorder", { fg = c.magenta })
        hl(0, "TelescopePromptBorder", { fg = c.cyan })
        hl(0, "TelescopeResultsBorder", { fg = c.blue_br })
        hl(0, "TelescopePreviewBorder", { fg = c.magenta_br })
        hl(0, "TelescopeSelection", { fg = c.cyan, bg = c.bg2, bold = true })
        hl(0, "TelescopeMatching", { fg = c.magenta_br, bold = true })

        -- Snacks (picker, explorer, terminal, input, notifier)
        -- snacks remaps window highlights, so these must be set explicitly or
        -- they fall back to WinSeparator / DiagnosticInfo instead of FloatBorder.
        hl(0, "SnacksNormal", { fg = c.fg, bg = c.bg1 })
        hl(0, "SnacksNormalNC", { fg = c.fg, bg = c.bg1 })
        hl(0, "SnacksWinSeparator", { fg = c.magenta })
        hl(0, "SnacksWinBar", { fg = c.cyan, bg = c.bg1, bold = true })
        hl(0, "SnacksWinBarNC", { fg = c.fg_dim, bg = c.bg1 })
        hl(0, "SnacksTitle", { fg = c.cyan, bg = c.bg1, bold = true })
        hl(0, "SnacksFooter", { fg = c.magenta_br, bg = c.bg1 })
        hl(0, "SnacksBackdrop", { bg = c.bg0 })

        -- Picker + explorer (<leader>e is a snacks picker in sidebar layout)
        hl(0, "SnacksPickerBorder", { fg = c.magenta, bg = c.bg1 })
        hl(0, "SnacksPickerTitle", { fg = c.cyan, bg = c.bg1, bold = true })
        hl(0, "SnacksPickerInputBorder", { fg = c.cyan, bg = c.bg1 })
        hl(0, "SnacksPickerInputTitle", { fg = c.cyan, bg = c.bg1, bold = true })
        hl(0, "SnacksPickerListBorder", { fg = c.blue_br, bg = c.bg1 })
        hl(0, "SnacksPickerPreviewBorder", { fg = c.magenta_br, bg = c.bg1 })
        hl(0, "SnacksPickerPreviewTitle", { fg = c.magenta_br, bg = c.bg1, bold = true })
        hl(0, "SnacksPickerMatch", { fg = c.magenta_br, bold = true })
        hl(0, "SnacksPickerDir", { fg = c.muted })

        -- vim.ui.input (defaults to DiagnosticInfo = blue)
        hl(0, "SnacksInputBorder", { fg = c.magenta, bg = c.bg1 })
        hl(0, "SnacksInputTitle", { fg = c.cyan, bg = c.bg1, bold = true })

        -- Neo-tree
        hl(0, "NeoTreeNormal", { fg = c.fg, bg = c.bg0 })
        hl(0, "NeoTreeDirectoryName", { fg = c.blue_br })
        hl(0, "NeoTreeDirectoryIcon", { fg = c.cyan })
        hl(0, "NeoTreeFileName", { fg = c.fg })
        hl(0, "NeoTreeFileIcon", { fg = c.magenta })
        hl(0, "NeoTreeIndentMarker", { fg = c.bg3 })
        hl(0, "NeoTreeRootName", { fg = c.magenta_br, bold = true })
        hl(0, "NeoTreeGitModified", { fg = c.blue_br })
        hl(0, "NeoTreeGitAdded", { fg = c.green })
        hl(0, "NeoTreeGitDeleted", { fg = c.red_br })

        -- Terminal (matches ghostty palette exactly)
        vim.g.terminal_color_0 = "#0a0314"
        vim.g.terminal_color_1 = "#e53e61"
        vim.g.terminal_color_2 = "#5cb960"
        vim.g.terminal_color_3 = "#f2e42e"
        vim.g.terminal_color_4 = "#3298fa"
        vim.g.terminal_color_5 = "#b82aff"
        vim.g.terminal_color_6 = "#3df2f2"
        vim.g.terminal_color_7 = "#e0e6ff"
        vim.g.terminal_color_8 = "#aa5abc"
        vim.g.terminal_color_9 = "#ff5779"
        vim.g.terminal_color_10 = "#70d674"
        vim.g.terminal_color_11 = "#ffff4d"
        vim.g.terminal_color_12 = "#50b0ff"
        vim.g.terminal_color_13 = "#d25dff"
        vim.g.terminal_color_14 = "#59ffff"
        vim.g.terminal_color_15 = "#ffffff"
      end,
    },
  },
}
