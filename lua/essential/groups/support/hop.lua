-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/phaazon/hop.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    HopNextKey = { fg = c.azure, bold = true },
    HopNextKey1 = { fg = c.blue, bold = true },
    HopNextKey2 = { fg = Util.blend_bg(c.blue, 0.6) },
    HopUnmatched = { fg = c.muted },
  }
end

return M
