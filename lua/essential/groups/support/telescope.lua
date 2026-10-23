-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    TelescopeBorder         = { fg = c.border, bg = c.bg_float },
    TelescopeNormal         = { fg = c.fg, bg = c.bg_float },
    TelescopePromptBorder   = { fg = c.orange, bg = c.bg_float },
    TelescopePromptTitle    = { fg = c.orange, bg = c.bg_float },
    TelescopeResultsComment = { fg = c.muted },
  }
end

return M
