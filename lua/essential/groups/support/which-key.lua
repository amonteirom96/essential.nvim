-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/folke/which-key.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.cyan },
    WhichKeyGroup     = { fg = c.blue },
    WhichKeyDesc      = { fg = c.azure },
    WhichKeySeparator = { fg = c.comment },
    WhichKeyNormal     = { bg = c.bg_float },
    WhichKeyValue     = { fg = c.muted },
  }
end

return M
