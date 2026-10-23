-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/nvim-treesitter/nvim-treesitter-context"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    TreesitterContext = { bg = Util.blend_bg(c.muted, 0.8) },
  }
end

return M
