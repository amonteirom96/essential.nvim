-- Adapted from folke/tokyonight.nvim (Apache-2.0).

local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  local dark = opts.transparent and c.none or c.surface2
  -- stylua: ignore
  return {
    NeoTreeDimText             = { fg = c.muted },
    NeoTreeFileName            = { fg = c.fg },
    NeoTreeGitModified         = { fg = c.orange },
    NeoTreeGitStaged           = { fg = c.green },
    NeoTreeGitUntracked        = { fg = c.azure },
    NeoTreeNormal              = { fg = c.fg, bg = c.bg_float },
    NeoTreeNormalNC            = { fg = c.fg, bg = c.bg_float },
    NeoTreeTabActive           = { fg = c.blue, bg = c.surface1, bold = true },
    NeoTreeTabInactive         = { fg = c.muted, bg = dark },
    NeoTreeTabSeparatorActive  = { fg = c.blue, bg = c.surface1 },
    NeoTreeTabSeparatorInactive= { fg = c.bg, bg = dark },
  }
end

return M
