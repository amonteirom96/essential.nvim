-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/justinmk/vim-sneak"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    Sneak      = { fg = c.surface1, bg = c.azure },
    SneakScope = { bg = c.select },
  }
end

return M
