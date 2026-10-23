-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/romgrk/barbar.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    BufferAlternate        = { bg = c.muted, fg = c.fg },
    BufferAlternateADDED   = { bg = c.muted, fg = c.git.add },
    BufferAlternateCHANGED = { bg = c.muted, fg = c.git.change },
    BufferAlternateDELETED = { bg = c.muted, fg = c.git.delete },
    BufferAlternateERROR   = { bg = c.muted, fg = c.diag.error },
    BufferAlternateHINT    = { bg = c.muted, fg = c.diag.hint },
    BufferAlternateINFO    = { bg = c.muted, fg = c.diag.info },
    BufferAlternateIndex   = { bg = c.muted, fg = c.diag.info },
    BufferAlternateMod     = { bg = c.muted, fg = c.diag.warn },
    BufferAlternateSign    = { bg = c.muted, fg = c.diag.info },
    BufferAlternateTarget  = { bg = c.muted, fg = c.orange },
    BufferAlternateWARN    = { bg = c.muted, fg = c.diag.warn },
    BufferCurrent          = { bg = c.bg, fg = c.fg },
    BufferCurrentADDED     = { bg = c.bg, fg = c.git.add },
    BufferCurrentCHANGED   = { bg = c.bg, fg = c.git.change },
    BufferCurrentDELETED   = { bg = c.bg, fg = c.git.delete },
    BufferCurrentERROR     = { bg = c.bg, fg = c.diag.error },
    BufferCurrentHINT      = { bg = c.bg, fg = c.diag.hint },
    BufferCurrentINFO      = { bg = c.bg, fg = c.diag.info },
    BufferCurrentIndex     = { bg = c.bg, fg = c.diag.info },
    BufferCurrentMod       = { bg = c.bg, fg = c.diag.warn },
    BufferCurrentSign      = { bg = c.bg, fg = c.bg },
    BufferCurrentTarget    = { bg = c.bg, fg = c.orange },
    BufferCurrentWARN      = { bg = c.bg, fg = c.diag.warn },
    BufferInactive         = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.muted, 0.8) },
    BufferInactiveADDED    = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.git.add, 0.8) },
    BufferInactiveCHANGED  = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.git.change, 0.8) },
    BufferInactiveDELETED  = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.git.delete, 0.8) },
    BufferInactiveERROR    = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.diag.error, 0.8) },
    BufferInactiveHINT     = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.diag.hint, 0.8) },
    BufferInactiveINFO     = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.diag.info, 0.8) },
    BufferInactiveIndex    = { bg = Util.blend_bg(c.surface1, 0.4), fg = c.muted },
    BufferInactiveMod      = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.diag.warn, 0.8) },
    BufferInactiveSign     = { bg = Util.blend_bg(c.surface1, 0.4), fg = c.bg },
    BufferInactiveTarget   = { bg = Util.blend_bg(c.surface1, 0.4), fg = c.orange },
    BufferInactiveWARN     = { bg = Util.blend_bg(c.surface1, 0.4), fg = Util.blend_bg(c.diag.warn, 0.8) },
    BufferOffset           = { bg = c.surface2, fg = c.muted },
    BufferTabpageFill      = { bg = Util.blend_bg(c.surface1, 0.8), fg = c.muted },
    BufferTabpages         = { bg = c.surface2, fg = c.none },
    BufferVisible          = { bg = c.surface2, fg = c.fg },
    BufferVisibleADDED     = { bg = c.surface2, fg = c.git.add },
    BufferVisibleCHANGED   = { bg = c.surface2, fg = c.git.change },
    BufferVisibleDELETED   = { bg = c.surface2, fg = c.git.delete },
    BufferVisibleERROR     = { bg = c.surface2, fg = c.diag.error },
    BufferVisibleHINT      = { bg = c.surface2, fg = c.diag.hint },
    BufferVisibleINFO      = { bg = c.surface2, fg = c.diag.info },
    BufferVisibleIndex     = { bg = c.surface2, fg = c.diag.info },
    BufferVisibleMod       = { bg = c.surface2, fg = c.diag.warn },
    BufferVisibleSign      = { bg = c.surface2, fg = c.diag.info },
    BufferVisibleTarget    = { bg = c.surface2, fg = c.orange },
    BufferVisibleWARN      = { bg = c.surface2, fg = c.diag.warn },
  }
end

return M
