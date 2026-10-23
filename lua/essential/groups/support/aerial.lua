-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/stevearc/aerial.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    AerialNormal = { fg = c.fg, bg = c.none },
    AerialGuide  = { fg = c.muted },
    AerialLine   = "LspInlayHint",
  }
  require("essential.groups.support.kinds").kinds(ret, "Aerial%sIcon")
  return ret
end

return M
