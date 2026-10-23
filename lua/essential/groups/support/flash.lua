-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/folke/flash.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.muted },
    FlashLabel    = { bg = c.azure, bold = true, fg = c.fg },
  }
end

return M
