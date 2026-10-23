-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/pwntester/octo.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    OctoDetailsLabel          = { fg = c.yellow, bold = true },
    OctoDetailsValue          = "@variable.member",
    OctoDirty                 = { fg = c.orange, bold = true },
    OctoIssueTitle            = { fg = c.azure, bold = true },
    OctoStateChangesRequested = "DiagnosticVirtualTextWarn",
    OctoStateClosed           = "DiagnosticVirtualTextError",
    OctoStateMerged           = { bg = Util.blend_bg(c.azure, 0.1), fg = c.azure },
    OctoStateOpen             = "DiagnosticVirtualTextHint",
    OctoStatePending          = "DiagnosticVirtualTextWarn",
    OctoStatusColumn          = { fg = c.yellow },

  }
end

return M
