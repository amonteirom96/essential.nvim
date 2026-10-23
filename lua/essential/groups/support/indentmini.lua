-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/nvimdev/indentmini.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentLine                 = { fg = c.muted, nocombine = true },
    IndentLineCurrent          = { fg = c.yellow, nocombine = true },
  }
end

return M
