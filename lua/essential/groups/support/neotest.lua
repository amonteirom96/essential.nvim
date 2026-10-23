-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/nvim-neotest/neotest"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  -- stylua: ignore
  return {
    NeotestAdapterName  = { fg = c.azure, bold = true },
    NeotestBorder       = { fg = c.blue },
    NeotestDir          = { fg = c.blue },
    NeotestExpandMarker = { fg = c.fg },
    NeotestFailed       = { fg = c.orange },
    NeotestFile         = { fg = c.cyan },
    NeotestFocused      = { fg = c.yellow },
    NeotestIndent       = { fg = c.fg },
    NeotestMarked       = { fg = c.blue },
    NeotestNamespace    = { fg = c.green },
    NeotestPassed       = { fg = c.green },
    NeotestRunning      = { fg = c.yellow },
    NeotestSkipped      = { fg = c.blue },
    NeotestTarget       = { fg = c.blue },
    NeotestTest         = { fg = c.fg },
    NeotestWinSelect    = { fg = c.blue },
  }
end

return M
