-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/ggandor/leap.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    LeapMatch          = { bg = c.azure, fg = c.fg, bold = true },
    LeapLabel          = { fg = c.azure, bold = true },
    LeapBackdrop       = { fg = c.muted },
  }
end

return M
