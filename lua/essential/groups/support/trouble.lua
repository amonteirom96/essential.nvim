-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/folke/trouble.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    TroubleText   = { fg = c.comment },
    TroubleCount  = { fg = c.azure, bg = c.muted },
    TroubleNormal = { fg = c.fg, bg = c.bg_float },
  }
end

return M
