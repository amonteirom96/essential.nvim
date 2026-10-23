-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/dense-analysis/ale"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    ALEErrorSign   = { fg = c.diag.error },
    ALEWarningSign = { fg = c.diag.warn },
  }
end

return M
