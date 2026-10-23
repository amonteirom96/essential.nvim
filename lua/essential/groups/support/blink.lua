-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/Saghen/blink.cmp"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    BlinkCmpDoc                 = { fg = c.fg, bg               = c.bg_float },
    BlinkCmpDocBorder           = { fg = c.border, bg = c.bg_float },
    BlinkCmpGhostText           = { fg = c.surface1 },
    BlinkCmpKindCodeium         = { fg = c.cyan, bg             = c.none },
    BlinkCmpKindCopilot         = { fg = c.cyan, bg             = c.none },
    BlinkCmpKindDefault         = { fg = c.comment, bg          = c.none },
    BlinkCmpKindSupermaven      = { fg = c.cyan, bg             = c.none },
    BlinkCmpKindTabNine         = { fg = c.cyan, bg             = c.none },
    BlinkCmpLabel               = { fg = c.fg, bg               = c.none },
    BlinkCmpLabelDeprecated     = { fg = c.muted, bg        = c.none, strikethrough = true },
    BlinkCmpLabelMatch          = { fg = c.yellow, bg            = c.none },
    BlinkCmpMenu                = { fg = c.fg, bg               = c.bg_float },
    BlinkCmpMenuBorder          = { fg = c.border, bg = c.bg_float },
    BlinkCmpSignatureHelp       = { fg = c.fg, bg               = c.bg_float },
    BlinkCmpSignatureHelpBorder = { fg = c.border, bg = c.bg_float },
  }

  require("essential.groups.support.kinds").kinds(ret, "BlinkCmpKind%s")
  return ret
end

return M
