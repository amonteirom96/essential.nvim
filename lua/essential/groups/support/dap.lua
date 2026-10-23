-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/mfussenegger/nvim-dap"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    DapStoppedLine = { bg = Util.blend_bg(c.diag.warn, 0.1) }, -- Used for "Warning" diagnostic virtual text
  }
end

return M
