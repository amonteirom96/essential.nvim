-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/echasnovski/mini.statusline"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c)
  -- stylua: ignore
  return {
    MiniStatuslineDevinfo     = { fg = c.comment, bg = c.muted },
    MiniStatuslineFileinfo    = { fg = c.comment, bg = c.muted },
    MiniStatuslineFilename    = { fg = c.comment, bg = c.surface1 },
    MiniStatuslineInactive    = { fg = c.blue, bg = c.surface2 },
    MiniStatuslineModeCommand = { fg = c.bg, bg = c.yellow, bold = true },
    MiniStatuslineModeInsert  = { fg = c.bg, bg = c.green, bold = true },
    MiniStatuslineModeNormal  = { fg = c.bg, bg = c.blue, bold = true },
    MiniStatuslineModeOther   = { fg = c.bg, bg = c.cyan, bold = true },
    MiniStatuslineModeReplace = { fg = c.bg, bg = c.orange, bold = true },
    MiniStatuslineModeVisual  = { fg = c.bg, bg = c.azure, bold = true },
  }
end

return M
