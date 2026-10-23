-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/lambdalisue/glyph-palette.vim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  -- stylua: ignore
  return {
    GlyphPalette1 = { fg = c.orange },
    GlyphPalette2 = { fg = c.green },
    GlyphPalette3 = { fg = c.yellow },
    GlyphPalette4 = { fg = c.blue },
    GlyphPalette6 = { fg = c.green },
    GlyphPalette7 = { fg = c.fg },
    GlyphPalette9 = { fg = c.orange },
  }
end

return M
