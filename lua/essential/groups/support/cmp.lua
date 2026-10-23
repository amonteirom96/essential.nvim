-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CmpDocumentation       = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border, bg = c.bg_float },
    CmpGhostText           = { fg = c.surface1 },
    CmpItemAbbr            = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated  = { fg = c.muted, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch       = { fg = c.yellow, bg = c.none },
    CmpItemAbbrMatchFuzzy  = { fg = c.yellow, bg = c.none },
    CmpItemKindCodeium     = { fg = c.cyan, bg = c.none },
    CmpItemKindCopilot     = { fg = c.cyan, bg = c.none },
    CmpItemKindSupermaven  = { fg = c.cyan, bg = c.none },
    CmpItemKindDefault     = { fg = c.comment, bg = c.none },
    CmpItemKindTabNine     = { fg = c.cyan, bg = c.none },
    CmpItemMenu            = { fg = c.comment, bg = c.none },
  }

  require("essential.groups.support.kinds").kinds(ret, "CmpItemKind%s")
  return ret
end

return M
