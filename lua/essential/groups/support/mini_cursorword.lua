-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.cursorword"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  -- stylua: ignore
  return {
    MiniCursorword        = { bg = c.muted },
    MiniCursorwordCurrent = { bg = c.muted },
  }
end

return M
