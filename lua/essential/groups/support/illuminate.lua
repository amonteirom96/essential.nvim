-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  -- stylua: ignore
  return {
    IlluminatedWordRead  = { bg = c.muted },
    IlluminatedWordText  = { bg = c.muted },
    IlluminatedWordWrite = { bg = c.muted },
    illuminatedCurWord   = { bg = c.muted },
    illuminatedWord      = { bg = c.muted },
  }
end

return M
