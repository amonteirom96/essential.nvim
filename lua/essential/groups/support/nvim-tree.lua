-- Adapted from folke/tokyonight.nvim (Apache-2.0).
local M = {}

M.url = "https://github.com/kyazdani42/nvim-tree.lua"

-- Highlight coverage adapted from TokyoNight; see THIRD_PARTY.md.
function M.get(c, opts)
  -- stylua: ignore
  return {
    NvimTreeFolderIcon   = { bg = c.none, fg = c.blue },
    NvimTreeGitDeleted   = { fg = c.git.delete },
    NvimTreeGitDirty     = { fg = c.git.change },
    NvimTreeGitNew       = { fg = c.git.add },
    NvimTreeImageFile    = { fg = c.fg },
    NvimTreeIndentMarker = { fg = c.muted },
    NvimTreeNormal       = { fg = c.fg, bg = c.bg_float },
    NvimTreeNormalNC     = { fg = c.fg, bg = c.bg_float },
    NvimTreeOpenedFile   = { bg = c.surface1 },
    NvimTreeRootFolder   = { fg = c.blue, bold = true },
    NvimTreeSpecialFile  = { fg = c.azure, underline = true },
    NvimTreeSymlink      = { fg = c.blue },
    NvimTreeWinSeparator = { fg = opts.styles.sidebars == "transparent" and c.border or c.bg_float, bg = c.bg_float },
  }
end

return M
