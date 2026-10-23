-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/gbprod/yanky.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    YankyPut    = "Search",
    YankyYanked = "IncSearch",
  }
end

return M
