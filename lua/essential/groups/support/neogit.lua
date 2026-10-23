-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/TimUntersberger/neogit"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  local Util = require("essential.groups.support_util")(c)
  -- stylua: ignore
  return {
    NeogitBranch               = { fg = c.azure },
    NeogitRemote               = { fg = c.azure },
    NeogitHunkHeader           = { bg = c.surface1, fg = c.fg },
    NeogitHunkHeaderHighlight  = { bg = c.muted, fg = c.blue },
    NeogitDiffContextHighlight = { bg = Util.blend_bg(c.muted, 0.5), fg = c.comment },
    NeogitDiffDeleteHighlight  = { fg = c.git.delete, bg = c.diff.delete },
    NeogitDiffAddHighlight     = { fg = c.git.add, bg = c.diff.add },
  }
end

return M
