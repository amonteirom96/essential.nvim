-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.hipatterns"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  -- stylua: ignore
  return {
    MiniHipatternsFixme = { fg = c.bg, bg = c.diag.error, bold = true },
    MiniHipatternsHack  = { fg = c.bg, bg = c.diag.warn, bold = true },
    MiniHipatternsNote  = { fg = c.bg, bg = c.diag.hint, bold = true },
    MiniHipatternsTodo  = { fg = c.bg, bg = c.diag.info, bold = true },
  }
end

return M
