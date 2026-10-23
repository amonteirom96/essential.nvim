-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/petertriho/nvim-scrollbar"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  -- stylua: ignore
  return {
    ScrollbarError        = { fg = c.diag.error, bg = c.none },
    ScrollbarErrorHandle  = { fg = c.diag.error, bg = c.surface1 },
    ScrollbarHandle       = { fg = c.none, bg = c.surface1 },
    ScrollbarHint         = { fg = c.diag.hint, bg = c.none },
    ScrollbarHintHandle   = { fg = c.diag.hint, bg = c.surface1 },
    ScrollbarInfo         = { fg = c.diag.info, bg = c.none },
    ScrollbarInfoHandle   = { fg = c.diag.info, bg = c.surface1 },
    ScrollbarMisc         = { fg = c.azure, bg = c.none },
    ScrollbarMiscHandle   = { fg = c.azure, bg = c.surface1 },
    ScrollbarSearch       = { fg = c.orange, bg = c.none },
    ScrollbarSearchHandle = { fg = c.orange, bg = c.surface1 },
    ScrollbarWarn         = { fg = c.diag.warn, bg = c.none },
    ScrollbarWarnHandle   = { fg = c.diag.warn, bg = c.surface1 },

  }
end

return M
