-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/folke/snacks.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  local ret = {
    SnacksNotifierDebug       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderDebug = { fg = Util.blend_bg(c.comment, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconDebug   = { fg = c.comment },
    SnacksNotifierTitleDebug  = { fg = c.comment },
    SnacksNotifierError       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderError = { fg = Util.blend_bg(c.diag.error, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconError   = { fg = c.diag.error },
    SnacksNotifierTitleError  = { fg = c.diag.error },
    SnacksNotifierInfo        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderInfo  = { fg = Util.blend_bg(c.diag.info, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconInfo    = { fg = c.diag.info },
    SnacksNotifierTitleInfo   = { fg = c.diag.info },
    SnacksNotifierTrace       = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderTrace = { fg = Util.blend_bg(c.azure, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconTrace   = { fg = c.azure },
    SnacksNotifierTitleTrace  = { fg = c.azure },
    SnacksNotifierWarn        = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    SnacksNotifierBorderWarn  = { fg = Util.blend_bg(c.diag.warn, 0.4), bg = opts.transparent and c.none or c.bg },
    SnacksNotifierIconWarn    = { fg = c.diag.warn },
    SnacksNotifierTitleWarn   = { fg = c.diag.warn },
    -- Dashboard
    SnacksDashboardDesc       = { fg = c.cyan },
    SnacksDashboardFooter     = { fg = c.yellow },
    SnacksDashboardHeader     = { fg = c.blue },
    SnacksDashboardIcon       = { fg = c.yellow },
    SnacksDashboardKey        = { fg = c.orange },
    SnacksDashboardSpecial    = { fg = c.azure },
    SnacksDashboardDir        = { fg = c.muted },
    -- Profiler
    SnacksProfilerIconInfo    = { bg = Util.blend_bg(c.yellow, 0.3), fg = c.yellow },
    SnacksProfilerBadgeInfo   = { bg = Util.blend_bg(c.yellow, 0.1), fg = c.yellow },
    SnacksFooterKey           = "SnacksProfilerIconInfo",
    SnacksFooterDesc          = "SnacksProfilerBadgeInfo",
    SnacksProfilerIconTrace   = { bg = Util.blend_bg(c.surface3, 0.3), fg = c.muted },
    SnacksProfilerBadgeTrace  = { bg = Util.blend_bg(c.surface3, 0.1), fg = c.muted },
    SnacksIndent              = { fg = c.muted, nocombine = true },
    SnacksIndentScope         = { fg = c.yellow, nocombine = true },
    SnacksZenIcon             = { fg = c.azure },
    SnacksInputIcon           = { fg = c.yellow },
    SnacksInputBorder         = { fg = c.yellow },
    SnacksInputTitle          = { fg = c.yellow },
    -- Picker
    SnacksPickerInputBorder   = { fg = c.orange, bg = c.bg_float },
    SnacksPickerInputTitle    = { fg = c.orange, bg = c.bg_float },
    SnacksPickerBoxTitle      = { fg = c.orange, bg = c.bg_float },
    SnacksPickerSelected      = { fg = c.azure},
    SnacksPickerToggle        = "SnacksProfilerBadgeInfo",
    SnacksPickerPickWinCurrent= { fg = c.fg, bg = c.azure, bold = true },
    SnacksPickerPickWin       = { fg = c.fg, bg = c.search, bold = true },
    SnacksGhLabel             = { fg = c.yellow, bold = true },
    SnacksDiffLabel           = { fg = c.yellow, bold = true },
    SnacksGhDiffHeader        = { bg = Util.blend_bg(c.yellow, 0.1), fg = c.yellow }
  }
  for i, color in ipairs(c.rainbow) do
    ret["SnacksIndent" .. i] = { fg = color, nocombine = true }
  end
  return ret
end

return M
