-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/echasnovski/mini.tabline"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    MiniTablineCurrent         = { fg = c.fg, bg = c.muted },
    MiniTablineFill            = { bg = c.bg },
    MiniTablineHidden          = { fg = c.muted, bg = c.surface2 },
    MiniTablineModifiedCurrent = { fg = c.diag.warn, bg = c.muted },
    MiniTablineModifiedHidden  = { bg = c.surface2, fg = Util.blend_bg(c.diag.warn, 0.7) },
    MiniTablineModifiedVisible = { fg = c.diag.warn, bg = c.surface2 },
    MiniTablineTabpagesection  = { bg = c.muted, fg = c.none },
    MiniTablineVisible         = { fg = c.fg, bg = c.surface2 },
  }
end

return M
