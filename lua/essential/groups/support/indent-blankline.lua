-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentBlanklineChar        = { fg = c.muted, nocombine = true },
    IndentBlanklineContextChar = { fg = c.yellow, nocombine = true },
    IblIndent                  = { fg = c.muted, nocombine = true },
    IblScope                   = { fg = c.yellow, nocombine = true },
  }
end

return M
