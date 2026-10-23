-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/MagicDuck/grug-far.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    GrugFarHelpHeader             = { fg = c.comment },
    GrugFarHelpHeaderKey          = { fg = c.cyan },
    GrugFarInputLabel             = { fg = c.yellow },
    GrugFarInputPlaceholder       = { fg = c.muted },
    GrugFarResultsChangeIndicator = { fg = c.git.change },
    GrugFarResultsHeader          = { fg = c.orange },
    GrugFarResultsLineColumn      = { fg = c.muted },
    GrugFarResultsLineNo          = { fg = c.muted },
    GrugFarResultsMatch           = { fg = c.bg, bg = c.orange },
    GrugFarResultsStats           = { fg = c.blue },
  }
end

return M
